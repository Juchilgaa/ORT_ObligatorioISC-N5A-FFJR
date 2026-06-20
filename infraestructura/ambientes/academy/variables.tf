variable "aws_region" {
  description = "Región de AWS donde se despliega la infraestructura."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nombre del proyecto."
  type        = string
  default     = "obligatorio-isc"
}

variable "environment" {
  description = "Ambiente de despliegue."
  type        = string
  default     = "academy"
}

variable "vpc_cidr" {
  description = "CIDR principal de la VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "app_port" {
  description = "Puerto de la aplicación."
  type        = number
  default     = 3000
}

variable "db_port" {
  description = "Puerto de PostgreSQL."
  type        = number
  default     = 5432
}

variable "azs" {
  description = "Zonas de disponibilidad usadas por el proyecto."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnet_cidrs" {
  description = "CIDR de subredes públicas."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_app_subnet_cidrs" {
  description = "CIDR de subredes privadas para aplicación."
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "private_db_subnet_cidrs" {
  description = "CIDR de subredes privadas para base de datos."
  type        = list(string)
  default     = ["10.0.21.0/24", "10.0.22.0/24"]
}

variable "db_name" {
  description = "Nombre de la base de datos inicial."
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "Usuario administrador de la base de datos."
  type        = string
  default     = "appuser"
}

variable "db_password" {
  description = "Contraseña de la base de datos."
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "Tipo de instancia RDS."
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "Almacenamiento inicial de RDS en GB."
  type        = number
  default     = 20
}

variable "db_backup_retention_period" {
  description = "Días de retención de backups automáticos."
  type        = number
  default     = 7
}

variable "rds_connections_threshold" {
  description = "Umbral de conexiones RDS para alarma CloudWatch."
  type        = number
  default     = 50
}

