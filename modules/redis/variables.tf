variable "env" {
  type = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "eks_security_group_id" {
  type = string
}

variable "project" {
  description = "Project name"
  type        = string
}
