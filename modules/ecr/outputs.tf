output "repository_urls" {
  description = "Mapeamento dos nomes dos repositórios para suas respectivas URLs"
  value       = { for k, v in module.ecr : k => v.repository_url }
}

output "repository_arns" {
  description = "Mapeamento dos nomes dos repositórios para seus respectivos ARNs"
  value       = { for k, v in module.ecr : k => v.repository_arn }
}
