
# +JUNTOS
# Ficheiro: infra/terraform/envs/dev/backend.tf
# Descrição: Configuração do backend do Terraform
# Autor: (+JUNTOS team)
# Locale: pt_PT

terraform {
  backend "gcs" {
    bucket  = "juntos-tf-state"
    prefix  = "dev"
  }
}
