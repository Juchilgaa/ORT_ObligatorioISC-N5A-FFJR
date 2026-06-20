output "cluster_name" {
  description = "Nombre del cluster EKS."
  value       = aws_eks_cluster.this.name
}

output "cluster_endpoint" {
  description = "Endpoint del cluster EKS."
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_arn" {
  description = "ARN del cluster EKS."
  value       = aws_eks_cluster.this.arn
}

output "node_group_name" {
  description = "Nombre del Node Group de EKS."
  value       = aws_eks_node_group.this.node_group_name
}

output "kubeconfig_command" {
  description = "Comando para configurar kubectl contra el cluster."
  value       = "aws eks update-kubeconfig --region us-east-1 --name ${aws_eks_cluster.this.name}"
}
