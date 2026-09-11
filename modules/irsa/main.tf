resource "aws_iam_policy" "analytics_policy" {
  name        = "policy-analytics-${var.env}"
  description = "Permissoes do analytics para SQS e DynamoDB"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["dynamodb:PutItem", "dynamodb:UpdateItem", "dynamodb:GetItem"]
        Resource = var.dynamodb_table_arn
      },
      {
        Effect   = "Allow"
        Action   = ["sqs:ReceiveMessage", "sqs:DeleteMessage", "sqs:GetQueueAttributes"]
        Resource = var.sqs_queue_arn
      }
    ]
  })
  tags = {
    Name = "policy-analytics-${var.env}"
  }
}

module "irsa_analytics" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts"
  version = "~> 6.8"

  name = "irsa-analytics-${var.env}"

  oidc_providers = {
    main = {
      provider_arn = var.oidc_provider_arn
      # Formato: ["namespace:nome-da-service-account"]
      namespace_service_accounts = ["default:analytics-sa"]
    }
  }

  policies = {
    policy = aws_iam_policy.analytics_policy.arn
  }
}

