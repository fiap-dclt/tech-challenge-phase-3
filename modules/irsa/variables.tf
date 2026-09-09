variable "env" {
  type        = string
  description = "Ambiente atual (ex: dev, prod, hml)"
}

variable "oidc_provider_arn" {
  type        = string
  description = "ARN do provedor OIDC gerado pelo módulo do EKS"
}

variable "dynamodb_table_arn" {
  type        = string
  description = "ARN da tabela do DynamoDB que o analytics irá acessar"
}

variable "sqs_queue_arn" {
  type        = string
  description = "ARN da fila SQS para permissão de leitura/escrita"
}

variable "project" {
  type = string
}
