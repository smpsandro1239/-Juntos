# +JUNTOS
# Ficheiro: infra/terraform/envs/dev/variables.tf
# Descrição: Variáveis Terraform para ambiente de desenvolvimento
# Autor: (+JUNTOS team)
# Locale: pt_PT

variable "project_id" {
  description = "ID do projeto GCP"
  type        = string
}

variable "project_name" {
  description = "Nome do projeto"
  type        = string
  default     = "juntos-dev"
}

variable "region" {
  description = "Região GCP"
  type        = string
  default     = "europe-west1"
}

variable "zone" {
  description = "Zona GCP"
  type        = string
  default     = "europe-west1-b"
}

variable "database_name" {
  description = "Nome da base de dados"
  type        = string
  default     = "juntos_dev"
}

variable "database_user" {
  description = "Utilizador da base de dados"
  type        = string
  default     = "juntos"
}

variable "database_password" {
  description = "Password da base de dados"
  type        = string
  sensitive   = true
}