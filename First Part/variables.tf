variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-central-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_a_cidr" {
  description = "The CIDR block for public subnet A"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_b_cidr" {
  description = "The CIDR block for public subnet B"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_a_cidr" {
  description = "The CIDR block for private subnet A"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_subnet_b_cidr" {
  description = "The CIDR block for private subnet B"
  type        = string
  default     = "10.0.4.0/24"
}

variable "availability_zone_a" {
  description = "The availability zone for subnet A"
  type        = string
  default     = "eu-central-1a"
}

variable "availability_zone_b" {
  description = "The availability zone for subnet B"
  type        = string
  default     = "eu-central-1b"
}

variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "my-eks-cluster"
}

variable "eks_node_group_name" {
  description = "The name of the EKS node group"
  type        = string
  default     = "my-eks-nodes"
}

variable "desired_size" {
  description = "The desired number of nodes in the EKS node group"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "The maximum number of nodes in the EKS node group"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "The minimum number of nodes in the EKS node group"
  type        = number
  default     = 2
}


variable "instance_type" {
  description = "The instance type for the node group"
  type        = string
  default     = "t3.medium"
}
