variable "name_prefix" {
  description = "Prefijo de nombres para los recursos."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR principal de la VPC."
  type        = string
}

variable "azs" {
  description = "Zonas de disponibilidad a utilizar."
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDR de subredes públicas."
  type        = list(string)
}

variable "private_app_subnet_cidrs" {
  description = "CIDR de subredes privadas para aplicación."
  type        = list(string)
}

variable "private_db_subnet_cidrs" {
  description = "CIDR de subredes privadas para base de datos."
  type        = list(string)
}
