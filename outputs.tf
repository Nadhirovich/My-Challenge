output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_a_id" {
  description = "The ID of the public subnet A"
  value       = aws_subnet.public_a.id
}

output "public_subnet_b_id" {
  description = "The ID of the public subnet B"
  value       = aws_subnet.public_b.id
}

output "private_subnet_a_id" {
  description = "The ID of the private subnet A"
  value       = aws_subnet.private_a.id
}

output "private_subnet_b_id" {
  description = "The ID of the private subnet B"
  value       = aws_subnet.private_b.id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.main.id
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.main.id
}

output "eks_cluster_id" {
  description = "The ID of the EKS Cluster"
  value       = aws_eks_cluster.main.id
}

output "eks_cluster_arn" {
  description = "The ARN of the EKS Cluster"
  value       = aws_eks_cluster.main.arn
}

output "eks_node_group_id" {
  description = "The ID of the EKS Node Group"
  value       = aws_eks_node_group.main.id
}

output "eks_node_group_arn" {
  description = "The ARN of the EKS Node Group"
  value       = aws_eks_node_group.main.arn
}

output "eks_cluster_security_group_id" {
  description = "The ID of the EKS Cluster Security Group"
  value       = aws_security_group.eks_cluster_sg.id
}

output "eks_cluster_role_arn" {
  description = "The ARN of the EKS Cluster IAM Role"
  value       = aws_iam_role.eks_cluster_role.arn
}

output "eks_node_role_arn" {
  description = "The ARN of the EKS Node IAM Role"
  value       = aws_iam_role.eks_node_role.arn
}
