resource "aws_security_group" "alb" {
  name        = "${var.name_prefix}-sg-alb"
  description = "Security Group del Application Load Balancer"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.name_prefix}-sg-alb"
  }
}

resource "aws_security_group" "app" {
  name        = "${var.name_prefix}-sg-app"
  description = "Security Group de las instancias de aplicacion"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.name_prefix}-sg-app"
  }
}

resource "aws_security_group" "rds" {
  name        = "${var.name_prefix}-sg-rds"
  description = "Security Group de la base de datos RDS"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.name_prefix}-sg-rds"
  }
}

resource "aws_security_group_rule" "alb_ingress_http" {
  description       = "HTTP desde Internet hacia ALB"
  type              = "ingress"
  security_group_id = aws_security_group.alb.id

  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "alb_egress_app" {
  description              = "Salida desde ALB hacia APP"
  type                     = "egress"
  security_group_id        = aws_security_group.alb.id
  source_security_group_id = aws_security_group.app.id

  from_port = var.app_port
  to_port   = var.app_port
  protocol  = "tcp"
}

resource "aws_security_group_rule" "app_ingress_alb" {
  description              = "Entrada a APP desde ALB"
  type                     = "ingress"
  security_group_id        = aws_security_group.app.id
  source_security_group_id = aws_security_group.alb.id

  from_port = var.app_port
  to_port   = var.app_port
  protocol  = "tcp"
}

resource "aws_security_group_rule" "app_egress_rds" {
  description              = "Salida desde APP hacia RDS"
  type                     = "egress"
  security_group_id        = aws_security_group.app.id
  source_security_group_id = aws_security_group.rds.id

  from_port = var.db_port
  to_port   = var.db_port
  protocol  = "tcp"
}

resource "aws_security_group_rule" "app_egress_https" {
  description       = "Salida HTTPS desde APP hacia Internet"
  type              = "egress"
  security_group_id = aws_security_group.app.id

  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "app_egress_http" {
  description       = "Salida HTTP desde APP hacia Internet"
  type              = "egress"
  security_group_id = aws_security_group.app.id

  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "rds_ingress_app" {
  description              = "Entrada a RDS desde APP"
  type                     = "ingress"
  security_group_id        = aws_security_group.rds.id
  source_security_group_id = aws_security_group.app.id

  from_port = var.db_port
  to_port   = var.db_port
  protocol  = "tcp"
}
