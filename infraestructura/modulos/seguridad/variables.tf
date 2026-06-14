variable "name_prefix" {
  description = "Prefijo de nombres para los recursos."
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC donde se crean los Security Groups."
  type        = string
}

variable "app_port" {
  description = "Puerto expuesto por la aplicación."
  type        = number
  default     = 3000
}

variable "db_port" {
  description = "Puerto de la base de datos."
  type        = number
  default     = 5432
}
