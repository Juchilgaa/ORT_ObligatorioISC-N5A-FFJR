output "alb_security_group_id" {
  description = "ID del Security Group del ALB."
  value       = aws_security_group.alb.id
}

output "app_security_group_id" {
  description = "ID del Security Group de la aplicación."
  value       = aws_security_group.app.id
}

output "rds_security_group_id" {
  description = "ID del Security Group de RDS."
  value       = aws_security_group.rds.id
}
