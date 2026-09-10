locals {
  env_vars = read_terragrunt_config("${get_terragrunt_dir()}/env.hcl", { locals = { env = "prod" } })

  # Extrai a variável env
  env = local.env_vars.locals.env
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
            provider "aws" {
                region = "us-east-1"
                default_tags {
                    tags = {
                    Project     = "FIAP Tech Challenge Phase 3"
                    Environment = local.env
                    ManagedBy   = "Terragrunt"
                    }
                }
            }
            EOF
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "toggle-master-automated"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "toggle-master-automated-locks"
  }
}