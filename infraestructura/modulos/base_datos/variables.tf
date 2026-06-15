variable "name_prefix" {
  description = "Prefijo de nombres para los recursos."
  type        = string
}

variable "private_db_subnet_ids" {
  description = "Subredes privadas donde se despliega RDS."
  type        = list(string)
}

variable "rds_security_group_id" {
  description = "Security Group asociado a RDS."
  type        = string
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
  description = "Almacenamiento inicial en GB."
  type        = number
  default     = 20
}

variable "db_backup_retention_period" {
  description = "Cantidad de días de retención de backups automáticos."
  type        = number
  default     = 7
}
