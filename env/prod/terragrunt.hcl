include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules//root"
}

inputs = {
  env             = "prod"
  project         = "FIAP Tech Challenge Phase 3"
  
  # VPC
  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  azs             = ["us-east-1a", "us-east-1b"]
  
  # EKS
  cluster_version = "1.30"
  
  # RDS
  db_engine         = "postgres"
  db_engine_version = "15.4"
  db_user           = "dbadmin"
  
  # DynamoDB
  table_name = "toggle-master-analytics"
  hash_key   = "id"
  
  # SQS
  queue_name = "analytics-queue"
  
  # Secrets Manager
  secret_name = "db-passwords"
}