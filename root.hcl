generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
            provider "aws" {
                region = "us-east-1"
                default_tags {
                    tags = {
                    Project     = "FIAP Tech Challenge Phase 3"
                    Environment = var.env
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
    bucket       = "toggle-master-iac-backend"
    key          = "${path_relative_to_include()}/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}