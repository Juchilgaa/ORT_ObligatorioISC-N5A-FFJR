data "aws_iam_role" "lab_role" {
  name = var.lab_role_name
}

resource "aws_eks_cluster" "this" {
  name     = "${var.name_prefix}-eks"
  role_arn = data.aws_iam_role.lab_role.arn

  vpc_config {
    subnet_ids              = var.private_subnet_ids
    security_group_ids      = [var.cluster_security_group_id]
    endpoint_public_access  = true
    endpoint_private_access = true
  }

  tags = merge(var.common_tags, {
    Name = "${var.name_prefix}-eks"
  })
}

resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.name_prefix}-eks-ng"
  node_role_arn   = data.aws_iam_role.lab_role.arn
  subnet_ids      = var.private_subnet_ids

  instance_types = var.node_instance_types
  disk_size      = var.node_disk_size

  scaling_config {
    desired_size = var.node_desired_size
    min_size     = var.node_min_size
    max_size     = var.node_max_size
  }

  update_config {
    max_unavailable = 1
  }

  tags = merge(var.common_tags, {
    Name = "${var.name_prefix}-eks-ng"
  })

  depends_on = [
    aws_eks_cluster.this
  ]

  lifecycle {
    ignore_changes = [
      scaling_config[0].desired_size
    ]
  }
}
