output "dashboard_name" {
  description = "Nombre del dashboard CloudWatch."
  value       = aws_cloudwatch_dashboard.this.dashboard_name
}

output "alb_unhealthy_alarm_name" {
  description = "Nombre de la alarma de targets no saludables."
  value       = aws_cloudwatch_metric_alarm.alb_unhealthy_hosts.alarm_name
}

output "rds_connections_alarm_name" {
  description = "Nombre de la alarma de conexiones RDS."
  value       = aws_cloudwatch_metric_alarm.rds_connections_high.alarm_name
}
