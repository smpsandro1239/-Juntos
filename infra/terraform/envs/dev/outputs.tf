
# +JUNTOS
# Ficheiro: infra/terraform/envs/dev/outputs.tf
# Descrição: Outputs da infraestrutura de desenvolvimento
# Autor: (+JUNTOS team)
# Locale: pt_PT

output "gke_cluster_name" {
  value = google_container_cluster.primary.name
}

output "sql_instance_name" {
  value = google_sql_database_instance.main.name
}

output "redis_instance_name" {
  value = google_redis_instance.main.name
}

output "storage_bucket_name" {
  value = google_storage_bucket.main.name
}
