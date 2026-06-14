output "vpc_id" {
  description = "ID de la VPC."
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "IDs de subredes públicas."
  value       = aws_subnet.public[*].id
}

output "private_app_subnet_ids" {
  description = "IDs de subredes privadas de aplicación."
  value       = aws_subnet.private_app[*].id
}

output "private_db_subnet_ids" {
  description = "IDs de subredes privadas de base de datos."
  value       = aws_subnet.private_db[*].id
}

output "vpc_cidr_block" {
  description = "CIDR principal de la VPC."
  value       = aws_vpc.this.cidr_block
}
