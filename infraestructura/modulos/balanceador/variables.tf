variable "name_prefix" {
  description = "Prefijo de nombres para los recursos."
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC."
  type        = string
}

variable "public_subnet_ids" {
  description = "Subredes públicas donde se despliega el ALB."
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "Security Group del ALB."
  type        = string
}

variable "app_port" {
  description = "Puerto de la aplicación."
  type        = number
  default     = 3000
}

variable "health_check_path" {
  description = "Path usado por el Target Group para validar salud."
  type        = string
  default     = "/health"
}
