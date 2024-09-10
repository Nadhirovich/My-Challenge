# My-Challenge

This repo is made to represent the cgi-challenge. Part I contains code files for the first four questions, and the second for the rest of the questions.

## Part I

### Question 1: Deploy a K8s Cluster

The cluster can be deployed on-premises as a standalone solution using any provisioner (e.g., Rancher, k3s, kind, kube-spray, kubeadm) or as a PaaS solution from a public cloud provider. To automate the deployment, Infrastructure as Code (IaC), Script, or Playbook should be used. The challenge taker's local machine should be able to connect to the cluster using `kubectl`, and `kubectl get nodes` should return at least two nodes with the status "Ready."

#### File: <span style="color:blue">`main.tf`</span>

This Terraform configuration file (<span style="color:blue">`main.tf`</span>) is used to deploy an Amazon EKS (Elastic Kubernetes Service) cluster on AWS. The file includes the following resources:

1. <span style="color:blue">**AWS Provider Configuration**</span>: Sets the AWS region.
2. <span style="color:blue">**VPC and Subnets**</span>: Creates a VPC, public and private subnets.
3. <span style="color:blue">**Internet Gateway and NAT Gateway**</span>: Sets up an Internet Gateway for public subnets and a NAT Gateway for private subnets.
4. <span style="color:blue">**Route Tables and Associations**</span>: Configures route tables for public and private subnets and associates them with the respective subnets.
5. <span style="color:blue">**Security Group**</span>: Creates a security group for the EKS cluster.
6. <span style="color:blue">**EKS Cluster**</span>: Deploys the EKS cluster and updates the kubeconfig.
7. <span style="color:blue">**IAM Roles and Policies**</span>: Creates IAM roles and attaches necessary policies for the EKS cluster and node groups.
8. <span style="color:blue">**EKS Node Group**</span>: Configures the node group for the EKS cluster with scaling settings and instance types.
