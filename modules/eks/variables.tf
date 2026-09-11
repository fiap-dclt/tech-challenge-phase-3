variable "env" {
  type = string
}

variable "kubernetes_version" {
  type    = string
  default = "1.35"
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "project" {
  type = string
}
