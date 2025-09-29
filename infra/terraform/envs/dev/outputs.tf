# +JUNTOS
# Ficheiro: infra/terraform/envs/dev/outputs.tf
# Descrição: Outputs Terraform para ambiente de desenvolvimento
# Autor: (+JUNTOS team)
# Locale: pt_PT

output "gke_cluster_name" {
  description = "Nome do cluster GKE"
  value       = google_container_cluster.primary.name
}

output "gke_cluster_endpoint" {
  description = "Endpoint do cluster GKE"
  value       = google_container_cluster.primary.endpoint
  sensitive   = true
}

output "database_connection_name" {
  description = "Nome de conexão da base de dados"
  value       = google_sql_database_instance.postgres.connection_name
}

output "database_ip" {
  description = "IP da base de dados"
  value       = google_sql_database_instance.postgres.ip_address
}

output "redis_host" {
  description = "Host do Redis"
  value       = google_redis_instance.cache.host
}

output "redis_port" {
  description = "Porta do Redis"
  value       = google_redis_instance.cache.port
}

output "storage_bucket_name" {
  description = "Nome do bucket de storage"
  value       = google_storage_bucket.app_storage.name
}

output "service_account_email" {
  description = "Email da conta de serviço"
  value       = google_service_account.app_service_account.email
}

output "vpc_network_name" {
  description = "Nome da rede VPC"
  value       = google_compute_network.vpc.name
}

output "subnet_name" {
  description = "Nome da subnet"
  value       = google_compute_subnetwork.subnet.name
}