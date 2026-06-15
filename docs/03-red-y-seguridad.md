# Red y seguridad

La arquitectura utiliza una VPC dedicada con subredes publicas, subredes privadas de aplicacion y subredes privadas de base de datos.

El flujo principal es Internet -> ALB publico -> EC2 privadas -> RDS privado.

Los Security Groups separan las capas: sg-alb -> sg-app -> sg-rds.

RDS no tiene acceso publico y solo acepta trafico desde la capa de aplicacion.
