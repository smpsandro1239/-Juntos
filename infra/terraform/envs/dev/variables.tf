
# +JUNTOS
# Ficheiro: infra/terraform/envs/dev/variables.tf
# Descrição: Variáveis para a infraestrutura de desenvolvimento
# Autor: (+JUNTOS team)
# Locale: pt_PT

variable "gcp_project_id" {
  description = "O ID do projeto GCP."
  type        = string
}

variable "gcp_region" {
  description = "A região GCP para os recursos."
  type        = string
  default     = "europe-west1"
}
