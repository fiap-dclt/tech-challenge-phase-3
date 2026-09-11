variable "env" {
  type = string
}

variable "project" {
  type = string
}

variable "repository_names" {
  description = "Lista de nomes dos repositórios ECR a serem criados"
  type        = list(string)
  default     = []
}
