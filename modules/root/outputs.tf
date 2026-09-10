output "sqs_queue_url" {
  value = module.sqs.queue_url
}

output "sqs_queue_arn" {
  value = module.sqs.queue_arn
}

output "secrets_arn" {
  value = module.secrets.secret_arn
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "redis_endpoint" {
  value = module.redis.redis_endpoint
}

output "dynamodb_endpoint" {
  value = module.dynamodb.dynamodb_endpoint
}

output "irsa_role_arn" {
  value = module.irsa.irsa_role_arn
}

output "eks_cluster_name" {
  value = try(module.eks[0].cluster_name, null)
}
