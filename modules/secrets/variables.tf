variable "env" {
  type        = string
  description = "Ambiente atual (ex: dev, prod, hml)"
}

variable "secret_name" {
  type        = string
  description = "Nome descritivo do segredo (ex: db-auth-password, redis-token)"
}

variable "secret_value" {
  type        = string
  sensitive   = true
  description = "Valor real e sensível do segredo a ser armazenado"
}

variable "project" {
  type = string
}
