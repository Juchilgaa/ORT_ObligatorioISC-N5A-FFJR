# RDS y persistencia

La persistencia se implementa con Amazon RDS PostgreSQL en subredes privadas.

La instancia RDS no es publica, utiliza Security Group restrictivo y backups automaticos.

La password se maneja como variable sensible y el archivo terraform.tfvars no debe subirse al repositorio.
