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

output "eks_cluster_name" {
  description = "Nombre del cluster EKS."
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "Endpoint del cluster EKS."
  value       = module.eks.cluster_endpoint
}

output "eks_node_group_name" {
  description = "Nombre del Node Group de EKS."
  value       = module.eks.node_group_name
}

output "eks_kubeconfig_command" {
  description = "Comando para configurar kubectl."
  value       = module.eks.kubeconfig_command
}
