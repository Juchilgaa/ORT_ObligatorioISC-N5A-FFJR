output "vpc_id" {
  description = "ID de la VPC creada."
  value       = module.red.vpc_id
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas."
  value       = module.red.public_subnet_ids
}

output "private_app_subnet_ids" {
  description = "IDs de las subredes privadas de aplicación o Kubernetes."
  value       = module.red.private_app_subnet_ids
}

output "private_db_subnet_ids" {
  description = "IDs de las subredes privadas de base de datos."
  value       = module.red.private_db_subnet_ids
}

output "app_security_group_id" {
  description = "ID del Security Group de aplicación o workloads."
  value       = module.seguridad.app_security_group_id
}

output "rds_security_group_id" {
  description = "ID del Security Group de RDS."
  value       = module.seguridad.rds_security_group_id
}

output "db_instance_id" {
  description = "Identificador de la instancia RDS."
  value       = module.base_datos.db_instance_id
}

output "db_endpoint" {
  description = "Endpoint de conexión a RDS."
  value       = module.base_datos.db_endpoint
  sensitive   = true
}

output "cloudwatch_dashboard_name" {
  description = "Nombre del dashboard de CloudWatch."
  value       = module.monitoreo.cloudwatch_dashboard_name
}

output "rds_connections_alarm_name" {
  description = "Nombre de la alarma de conexiones de RDS."
  value       = module.monitoreo.rds_connections_alarm_name
}
