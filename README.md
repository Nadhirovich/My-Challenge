# My-Challenge

This repo is made to represent the cgi-challenge. Part I contains code files for the first four questions, and the second for the rest of the questions.

## Part I

### Question 1: Deploy a K8s Cluster

The cluster can be deployed on-premises as a standalone solution using any provisioner (e.g., Rancher, k3s, kind, kube-spray, kubeadm) or as a PaaS solution from a public cloud provider. To automate the deployment, Infrastructure as Code (IaC), Script, or Playbook should be used. The challenge taker's local machine should be able to connect to the cluster using `kubectl`, and `kubectl get nodes` should return at least two nodes with the status "Ready."

### Introduction to the Solution

For this challenge, I chose to deploy the Kubernetes (K8s) cluster as a PaaS (Platform as a Service) solution from the public cloud provider AWS (Amazon Web Services). To automate the deployment, I used Terraform as the Infrastructure as Code (IaC) tool.

#### Reasons for Choosing AWS and Terraform:

1. **AWS (Amazon Web Services)**:
   - **Scalability**: AWS provides a highly scalable environment, allowing the cluster to grow as needed without significant manual intervention.
   - **Reliability**: AWS offers robust and reliable infrastructure with high availability and fault tolerance.
   - **Managed Services**: AWS’s managed Kubernetes service, EKS (Elastic Kubernetes Service), simplifies cluster management and reduces operational overhead.

2. **Terraform**:
   - **Automation**: Terraform enables automated and repeatable infrastructure deployments, ensuring consistency and reducing the risk of human error.
   - **Declarative Language**: Terraform’s declarative configuration language makes it easy to define and manage infrastructure as code.
   - **Provider Support**: Terraform has extensive support for AWS resources, making it an ideal choice for deploying infrastructure on AWS.

This combination of AWS and Terraform provides a powerful and efficient solution for deploying and managing a Kubernetes cluster, ensuring scalability, reliability, and ease of automation.

#### File: **`main.tf`** [https://github.com/HoussemDellai/kubernetes-ingress-tls-ssl-https]

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
