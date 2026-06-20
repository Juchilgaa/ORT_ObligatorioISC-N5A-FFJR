variable "name_prefix" {
  description = "Prefijo para nombrar recursos."
  type        = string
}

variable "lab_role_name" {
  description = "Nombre del rol IAM disponible en AWS Academy."
  type        = string
  default     = "LabRole"
}

variable "private_subnet_ids" {
  description = "Subredes privadas donde se desplegarán los nodos de EKS."
  type        = list(string)
}

variable "cluster_security_group_id" {
  description = "Security Group base asociado al cluster EKS."
  type        = string
}

variable "node_instance_types" {
  description = "Tipos de instancia para los nodos administrados de EKS."
  type        = list(string)
  default     = ["t3.small"]
}

variable "node_desired_size" {
  description = "Cantidad deseada de nodos."
  type        = number
  default     = 2
}

variable "node_min_size" {
  description = "Cantidad mínima de nodos."
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Cantidad máxima de nodos."
  type        = number
  default     = 3
}

variable "node_disk_size" {
  description = "Tamaño del disco de los nodos en GB."
  type        = number
  default     = 20
}

variable "common_tags" {
  description = "Tags comunes del proyecto."
  type        = map(string)
  default     = {}
}
