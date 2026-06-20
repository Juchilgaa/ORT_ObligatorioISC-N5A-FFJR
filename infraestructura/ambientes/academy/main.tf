locals {
  name_prefix = "${var.project_name}-${var.environment}"
}

module "red" {
  source = "../../modulos/red"

  name_prefix              = local.name_prefix
  vpc_cidr                 = var.vpc_cidr
  azs                      = var.azs
  public_subnet_cidrs      = var.public_subnet_cidrs
  private_app_subnet_cidrs = var.private_app_subnet_cidrs
  private_db_subnet_cidrs  = var.private_db_subnet_cidrs
}

module "seguridad" {
  source = "../../modulos/seguridad"

  name_prefix = local.name_prefix
  vpc_id      = module.red.vpc_id
  app_port    = var.app_port
  db_port     = var.db_port
}


module "base_datos" {
  source = "../../modulos/base_datos"

  name_prefix                = local.name_prefix
  private_db_subnet_ids      = module.red.private_db_subnet_ids
  rds_security_group_id      = module.seguridad.rds_security_group_id
  db_name                    = var.db_name
  db_username                = var.db_username
  db_password                = var.db_password
  db_instance_class          = var.db_instance_class
  db_allocated_storage       = var.db_allocated_storage
  db_backup_retention_period = var.db_backup_retention_period
}

module "monitoreo" {
  source = "../../modulos/monitoreo"

  name_prefix               = local.name_prefix
  db_instance_id            = module.base_datos.db_instance_id
  rds_connections_threshold = var.rds_connections_threshold
}

module "eks" {
  source = "../../modulos/eks"

  name_prefix               = var.name_prefix
  lab_role_name             = var.lab_role_name
  private_subnet_ids        = module.red.private_app_subnet_ids
  cluster_security_group_id = module.seguridad.app_security_group_id
  common_tags               = var.common_tags
}
