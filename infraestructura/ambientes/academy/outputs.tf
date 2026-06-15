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

output "alb_dns_name" {
  description = "DNS público del Application Load Balancer."
  value       = module.balanceador.alb_dns_name
}

output "target_group_arn" {
  description = "ARN del Target Group de aplicación."
  value       = module.balanceador.target_group_arn
}

output "db_endpoint" {
  description = "Endpoint privado de RDS."
  value       = module.base_datos.db_endpoint
  sensitive   = true
}

output "db_name" {
  description = "Nombre de la base de datos."
  value       = module.base_datos.db_name
}
