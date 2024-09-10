# My-Challenge

This repo is made to represent the cgi-challenge. Part I contains code files for the first four questions, and the second for the rest of the questions.

## Part I

### Question 1: Deploy a K8s Cluster

The cluster can be deployed on-premises as a standalone solution using any provisioner (e.g., Rancher, k3s, kind, kube-spray, kubeadm) or as a PaaS solution from a public cloud provider. To automate the deployment, Infrastructure as Code (IaC), Script, or Playbook should be used. The challenge taker's local machine should be able to connect to the cluster using `kubectl`, and `kubectl get nodes` should return at least two nodes with the status "Ready."

#### File: **`main.tf`**

This Terraform configuration file (**`main.tf`**) is used to deploy an Amazon EKS (Elastic Kubernetes Service) cluster on AWS. The file includes the following resources:

1. **AWS Provider Configuration**: Sets the AWS region.
2. **VPC and Subnets**: Creates a VPC, public and private subnets.
3. **Internet Gateway and NAT Gateway**: Sets up an Internet Gateway for public subnets and a NAT Gateway for private subnets.
4. **Route Tables and Associations**: Configures route tables for public and private subnets and associates them with the respective subnets.
5. **Security Group**: Creates a security group for the EKS cluster.
6. **EKS Cluster**: Deploys the EKS cluster and updates the kubeconfig.
7. **IAM Roles and Policies**: Creates IAM roles and attaches necessary policies for the EKS cluster and node groups.
8. **EKS Node Group**: Configures the node group for the EKS cluster with scaling settings and instance types.
#### File: **`variables.tf`**

This file defines the input variables used throughout the Terraform configuration. These variables allow for flexible and reusable code by parameterizing values such as the AWS region, VPC CIDR block, subnet CIDR blocks, availability zones, EKS cluster name, node group name, desired number of nodes, maximum and minimum number of nodes, and instance type for the node group.

#### File: **`outputs.tf`**

This file defines the output values that are useful for referencing the created resources. Outputs can include information such as the VPC ID, subnet IDs, EKS cluster name, and node group name. These outputs provide a convenient way to access and use the resource attributes in other parts of the Terraform configuration or in other Terraform modules.

