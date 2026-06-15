output "db_instance_id" {
  description = "ID de la instancia RDS."
  value       = aws_db_instance.this.id
}

output "db_endpoint" {
  description = "Endpoint privado de RDS."
  value       = aws_db_instance.this.endpoint
}

output "db_name" {
  description = "Nombre de la base de datos."
  value       = aws_db_instance.this.db_name
}

output "db_subnet_group_name" {
  description = "Nombre del DB subnet group."
  value       = aws_db_subnet_group.this.name
}
