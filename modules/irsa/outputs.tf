output "analytics_iam_role_arn" {
  value       = module.irsa_analytics.arn
  description = "ARN da IAM Role criada para o Service Account do analytics"
}
