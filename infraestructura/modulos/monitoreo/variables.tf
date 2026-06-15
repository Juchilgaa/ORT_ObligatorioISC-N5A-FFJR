variable "name_prefix" {
  description = "Prefijo de nombres para recursos."
  type        = string
}

variable "alb_arn_suffix" {
  description = "ARN suffix del ALB para métricas CloudWatch."
  type        = string
}

variable "target_group_arn_suffix" {
  description = "ARN suffix del Target Group para métricas CloudWatch."
  type        = string
}

variable "db_instance_id" {
  description = "ID de instancia RDS."
  type        = string
}

variable "asg_name" {
  description = "Nombre del Auto Scaling Group."
  type        = string
  default     = ""
}

variable "alarm_email" {
  description = "Email para futuras notificaciones de alarmas. En esta etapa puede quedar vacío."
  type        = string
  default     = ""
}

variable "rds_connections_threshold" {
  description = "Umbral de conexiones para alarma RDS."
  type        = number
  default     = 50
}

variable "alb_unhealthy_threshold" {
  description = "Umbral de targets no saludables."
  type        = number
  default     = 1
}
