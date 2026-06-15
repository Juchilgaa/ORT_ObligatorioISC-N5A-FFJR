# Matriz de trazabilidad

| Requerimiento | Implementacion | Estado |
|---|---|---|
| Balanceador | ALB publico | Implementado |
| Red | VPC con subredes publicas y privadas | Implementado |
| Seguridad | Security Groups por capa | Implementado |
| Base de datos | RDS PostgreSQL privado | Implementado |
| Backups | Backups automaticos RDS | Implementado |
| Monitoreo | CloudWatch alarms y dashboard | Implementado |
| Computo | EC2 con Auto Scaling Group | Pendiente |
| Aplicacion | Docker sobre EC2 | Pendiente |
