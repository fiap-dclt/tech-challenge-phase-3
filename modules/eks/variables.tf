variable "env" {
  type = string
}

variable "cluster_version" {
  type    = string
  default = "1.30"
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
