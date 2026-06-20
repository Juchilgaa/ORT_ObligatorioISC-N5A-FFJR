output "app_security_group_id" {
  description = "ID del Security Group de aplicacion o workloads Kubernetes."
  value       = aws_security_group.app.id
}

output "rds_security_group_id" {
  description = "ID del Security Group de RDS."
  value       = aws_security_group.rds.id
}
