
# +JUNTOS
# Ficheiro: infra/terraform/envs/dev/main.tf
# Descrição: Infraestrutura principal para o ambiente de desenvolvimento
# Autor: (+JUNTOS team)
# Locale: pt_PT

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

resource "google_container_cluster" "primary" {
  name     = "${var.gcp_project_id}-gke"
  location = var.gcp_region

  # We can't create a GKE Autopilot cluster with Terraform yet.
  # This is a placeholder for a standard cluster.
  # We will manage the cluster manually for now.
  initial_node_count = 1
}

resource "google_sql_database_instance" "main" {
  name             = "${var.gcp_project_id}-db"
  database_version = "POSTGRES_15"
  region           = var.gcp_region

  settings {
    tier = "db-g1-small"
  }
}

resource "google_redis_instance" "main" {
  name           = "${var.gcp_project_id}-redis"
  tier           = "BASIC"
  memory_size_gb = 1
  region         = var.gcp_region
}

resource "google_storage_bucket" "main" {
  name     = "${var.gcp_project_id}-bucket"
  location = var.gcp_region
}
