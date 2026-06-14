output "project_name" {
  description = "Nombre del proyecto."
  value       = var.project_name
}

output "environment" {
  description = "Ambiente configurado."
  value       = var.environment
}

output "aws_region" {
  description = "Región AWS configurada."
  value       = var.aws_region
}

output "alb_security_group_id" {
  description = "ID del Security Group del ALB."
  value       = module.seguridad.alb_security_group_id
}

output "app_security_group_id" {
  description = "ID del Security Group de la aplicación."
  value       = module.seguridad.app_security_group_id
}

output "rds_security_group_id" {
  description = "ID del Security Group de RDS."
  value       = module.seguridad.rds_security_group_id
}
