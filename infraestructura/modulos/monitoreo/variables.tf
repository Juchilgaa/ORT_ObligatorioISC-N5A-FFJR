variable "name_prefix" {
  description = "Prefijo para nombrar recursos."
  type        = string
}

variable "db_instance_id" {
  description = "Identificador de la instancia RDS."
  type        = string
}

variable "rds_connections_threshold" {
  description = "Umbral de conexiones para alarma de RDS."
  type        = number
  default     = 50
}

variable "common_tags" {
  description = "Tags comunes del proyecto."
  type        = map(string)
  default     = {}
}
