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

module "balanceador" {
  source = "../../modulos/balanceador"

  name_prefix           = local.name_prefix
  vpc_id                = module.red.vpc_id
  public_subnet_ids     = module.red.public_subnet_ids
  alb_security_group_id = module.seguridad.alb_security_group_id
  app_port              = var.app_port
  health_check_path     = var.health_check_path
}
