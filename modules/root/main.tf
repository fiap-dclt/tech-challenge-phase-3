module "sqs" {
  source     = "${get_path_to_repo_root()}/modules/sqs"
  env        = var.env
  queue_name = var.queue_name
  project    = var.project
}

module "secrets" {
  source       = "${get_path_to_repo_root()}/modules/secrets"
  env          = var.env
  secret_name  = var.secret_name
  secret_value = var.secret_value
  project      = var.project
}

module "vpc" {
  source          = "${get_path_to_repo_root()}/modules/vpc"
  env             = var.env
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
  project         = var.project
}

module "rds_auth" {
  source                 = "${get_path_to_repo_root()}/modules/rds"
  env                    = var.env
  vpc_id                 = module.vpc.vpc_id
  private_subnet_ids     = module.vpc.private_subnet_ids
  node_security_group_id = module.eks.node_security_group_id
  project                = var.project
  microservice           = "auth-service"
  db_engine              = var.db_engine
  db_engine_version      = var.db_engine_version
  db_user                = var.db_user
  db_pass                = var.db_pass
}

module "rds_flag" {
  source                 = "${get_path_to_repo_root()}/modules/rds"
  env                    = var.env
  vpc_id                 = module.vpc.vpc_id
  private_subnet_ids     = module.vpc.private_subnet_ids
  node_security_group_id = module.eks.node_security_group_id
  project                = var.project
  microservice           = "flag-service"
  db_engine              = var.db_engine
  db_engine_version      = var.db_engine_version
  db_user                = var.db_user
  db_pass                = var.db_pass
}

module "rds_targeting" {
  source                 = "${get_path_to_repo_root()}/modules/rds"
  env                    = var.env
  vpc_id                 = module.vpc.vpc_id
  private_subnet_ids     = module.vpc.private_subnet_ids
  node_security_group_id = module.eks.node_security_group_id
  project                = var.project
  microservice           = "targeting-service"
  db_engine              = var.db_engine
  db_engine_version      = var.db_engine_version
  db_user                = var.db_user
  db_pass                = var.db_pass
}

module "redis" {
  source                 = "${get_path_to_repo_root()}/modules/redis"
  env                    = var.env
  vpc_id                 = module.vpc.vpc_id
  private_subnet_ids     = module.vpc.private_subnet_ids
  node_security_group_id = module.eks.node_security_group_id
  project                = var.project
}

module "dynamodb" {
  source     = "${get_path_to_repo_root()}/modules/dynamodb"
  env        = var.env
  table_name = var.table_name
  hash_key   = var.hash_key
  project    = var.project
}

module "irsa" {
  source             = "${get_path_to_repo_root()}/modules/irsa"
  env                = var.env
  oidc_provider_arn  = module.eks.oidc_provider_arn
  dynamodb_table_arn = module.dynamodb.table_arn
  sqs_queue_arn      = module.sqs.queue_arn
  project            = var.project
}

module "eks" {
  source             = "${get_path_to_repo_root()}/modules/eks"
  env                = var.env
  cluster_version    = var.cluster_version
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  project            = var.project
}
