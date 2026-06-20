resource "aws_security_group" "app" {
  name        = "${var.name_prefix}-sg-app"
  description = "Security Group para capa de aplicacion o workloads Kubernetes."
  vpc_id      = var.vpc_id

  tags = merge(var.common_tags, {
    Name = "${var.name_prefix}-sg-app"
  })
}

resource "aws_security_group" "rds" {
  name        = "${var.name_prefix}-sg-rds"
  description = "Security Group para base de datos RDS."
  vpc_id      = var.vpc_id

  tags = merge(var.common_tags, {
    Name = "${var.name_prefix}-sg-rds"
  })
}

resource "aws_security_group_rule" "app_egress_http" {
  description       = "Salida HTTP desde workloads hacia Internet mediante NAT."
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.app.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "app_egress_https" {
  description       = "Salida HTTPS desde workloads hacia Internet mediante NAT."
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.app.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "app_egress_rds" {
  description              = "Salida desde workloads hacia RDS."
  type                     = "egress"
  from_port                = var.db_port
  to_port                  = var.db_port
  protocol                 = "tcp"
  security_group_id        = aws_security_group.app.id
  source_security_group_id = aws_security_group.rds.id
}

resource "aws_security_group_rule" "rds_ingress_app" {
  description              = "Entrada a RDS desde capa de aplicacion o workloads Kubernetes."
  type                     = "ingress"
  from_port                = var.db_port
  to_port                  = var.db_port
  protocol                 = "tcp"
  security_group_id        = aws_security_group.rds.id
  source_security_group_id = aws_security_group.app.id
}
