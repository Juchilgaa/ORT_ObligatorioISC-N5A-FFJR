output "cloudwatch_dashboard_name" {
  description = "Nombre del dashboard de CloudWatch."
  value       = aws_cloudwatch_dashboard.this.dashboard_name
}

output "rds_connections_alarm_name" {
  description = "Nombre de la alarma de conexiones de RDS."
  value       = aws_cloudwatch_metric_alarm.rds_connections_high.alarm_name
}
