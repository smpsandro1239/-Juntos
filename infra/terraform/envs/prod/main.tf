# +JUNTOS - Staging Environment
# Ficheiro: infra/terraform/envs/stg/main.tf
# Descrição: Infraestrutura de staging no GCP
# Autor: (+JUNTOS team)
# Locale: pt_PT

terraform {
  required_version = ">= 1.8"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.0"
    }
  }

  backend "gcs" {
    bucket = "juntos-stg-tfstate"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# Ativar APIs necessárias
resource "google_project_service" "apis" {
  for_each = toset([
    "container.googleapis.com",
    "sqladmin.googleapis.com",
    "redis.googleapis.com",
    "storage.googleapis.com",
    "secretmanager.googleapis.com",
    "monitoring.googleapis.com",
    "logging.googleapis.com",
    "run.googleapis.com",
    "vpcaccess.googleapis.com",
  ])

  service = each.value
  disable_on_destroy = false
}

# VPC Network
resource "google_compute_network" "vpc" {
  name                    = "${var.project_name}-vpc"
  auto_create_subnetworks = false
  depends_on             = [google_project_service.apis]
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project_name}-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region        = var.region
  network       = google_compute_network.vpc.id

  secondary_ip_range {
    range_name    = "pods"
    ip_cidr_range = "10.1.0.0/16"
  }

  secondary_ip_range {
    range_name    = "services"
    ip_cidr_range = "10.2.0.0/16"
  }
}

# Cloud SQL PostgreSQL (Staging)
resource "google_sql_database_instance" "postgres" {
  name             = "${var.project_name}-postgres"
  database_version = "POSTGRES_15"
  region           = var.region

  settings {
    tier              = "db-g1-small"
    availability_type = "ZONAL"
    disk_size         = 50
    disk_type         = "PD_SSD"

    backup_configuration {
      enabled    = true
      start_time = "03:00"
    }

    maintenance_window {
      day  = 7
      hour = 3
    }

    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.vpc.id
    }
  }

  depends_on = [google_project_service.apis]
}

resource "google_sql_database" "database" {
  name     = var.database_name
  instance = google_sql_database_instance.postgres.name
}

resource "google_sql_user" "user" {
  name     = var.database_user
  instance = google_sql_database_instance.postgres.name
  password = var.database_password
}

# Redis Instance (Staging)
resource "google_redis_instance" "cache" {
  name           = "${var.project_name}-redis"
  tier           = "STANDARD_HA"
  memory_size_gb = 2
  region         = var.region

  authorized_network = google_compute_network.vpc.id

  depends_on = [google_project_service.apis]
}

# Cloud Storage Bucket
resource "google_storage_bucket" "app_storage" {
  name     = "${var.project_name}-storage-${random_id.bucket_suffix.hex}"
  location = var.region

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      age = 30
    }
    action {
      type = "Delete"
    }
  }

  cors {
    origin          = ["https://admin-stg.juntos.pt"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}

resource "random_id" "bucket_suffix" {
  byte_length = 8
}

# Cloud Run para Backend
resource "google_cloud_run_service" "backend" {
  name     = "${var.project_name}-backend"
  location = var.region

  template {
    spec {
      containers {
        image = "gcr.io/${var.project_id}/juntos-backend:latest"

        env {
          name  = "SPRING_PROFILES_ACTIVE"
          value = "stg"
        }

        env {
          name  = "DB_HOST"
          value = google_sql_database_instance.postgres.connection_name
        }

        env {
          name  = "DB_USER"
          value = google_sql_user.user.name
        }

        env {
          name = "DB_PASSWORD"
          value_from {
            secret_key_ref {
              name = google_secret_manager_secret.database_password.secret_id
              key  = "latest"
            }
          }
        }

        resources {
          limits = {
            cpu    = "1000m"
            memory = "1Gi"
          }
        }
      }

      service_account_name = google_service_account.app_service_account.email
    }

    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale" = "10"
        "run.googleapis.com/cpu-throttling" = false
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  depends_on = [google_project_service.apis]
}

# Cloud Run para Admin Panel
resource "google_cloud_run_service" "admin" {
  name     = "${var.project_name}-admin"
  location = var.region

  template {
    spec {
      containers {
        image = "gcr.io/${var.project_id}/juntos-admin:latest"

        env {
          name  = "VITE_API_BASE_URL"
          value = google_cloud_run_service.backend.status[0].url
        }

        resources {
          limits = {
            cpu    = "500m"
            memory = "512Mi"
          }
        }
      }
    }

    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale" = "5"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  depends_on = [google_project_service.apis, google_cloud_run_service.backend]
}

# Secret Manager
resource "google_secret_manager_secret" "database_password" {
  secret_id = "database-password"

  replication {
    auto {}
  }

  depends_on = [google_project_service.apis]
}

resource "google_secret_manager_secret_version" "database_password" {
  secret      = google_secret_manager_secret.database_password.id
  secret_data = var.database_password
}

# IAM Service Account
resource "google_service_account" "app_service_account" {
  account_id   = "${var.project_name}-app"
  display_name = "Conta de serviço da aplicação +JUNTOS (Staging)"
}

resource "google_project_iam_member" "app_permissions" {
  for_each = toset([
    "roles/cloudsql.client",
    "roles/storage.objectAdmin",
    "roles/secretmanager.secretAccessor",
    "roles/monitoring.metricWriter",
    "roles/logging.logWriter",
    "roles/run.invoker",
  ])

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.app_service_account.email}"
}

# Load Balancer (opcional para staging)
resource "google_compute_global_address" "lb_ip" {
  name = "${var.project_name}-lb-ip"
}

resource "google_compute_backend_service" "backend_service" {
  name        = "${var.project_name}-backend-service"
  protocol    = "HTTP"
  timeout_sec = 30

  backend {
    group = google_compute_region_network_endpoint_group.cloud_run_neg.id
  }
}

resource "google_compute_region_network_endpoint_group" "cloud_run_neg" {
  name                  = "${var.project_name}-cloud-run-neg"
  region                = var.region
  network_endpoint_type = "SERVERLESS"
  cloud_run {
    service = google_cloud_run_service.backend.name
  }
}

resource "google_compute_url_map" "url_map" {
  name            = "${var.project_name}-url-map"
  default_service = google_compute_backend_service.backend_service.id
}

resource "google_compute_target_http_proxy" "http_proxy" {
  name    = "${var.project_name}-http-proxy"
  url_map = google_compute_url_map.url_map.id
}

resource "google_compute_global_forwarding_rule" "forwarding_rule" {
  name       = "${var.project_name}-forwarding-rule"
  target     = google_compute_target_http_proxy.http_proxy.id
  port_range = "80"
  ip_address = google_compute_global_address.lb_ip.address
}
