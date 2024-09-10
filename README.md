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

### Technical Details

Before running the Terraform code, we need to install both `eksctl` and `kubectl` on our local machine using Git Bash on Windows. Here’s a brief overview of why you need them:

- **eksctl**: This is a command-line tool specifically for creating and managing EKS clusters. It simplifies the process of setting up the cluster.
- **kubectl**: This is the Kubernetes command-line tool that allows us to interact with our Kubernetes cluster. We will need it to manage and deploy applications on our EKS cluster.

#### Steps to Install `eksctl` and `kubectl` on Git Bash

1. **Install `eksctl`**

    ```bash
    # Download and install eksctl
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
    sudo mv /tmp/eksctl /usr/local/bin

    # Verify the installation
    eksctl version
    ```

2. **Install `kubectl`**

    ```bash
    # Download the latest release of kubectl
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/windows/amd64/kubectl.exe"

    # Move kubectl to a directory in your PATH
    mkdir -p $HOME/bin && mv ./kubectl.exe $HOME/bin/kubectl.exe && export PATH=$PATH:$HOME/bin

    # Verify the installation
    kubectl version --client
    ```

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


### Deploying the EKS Cluster

Please run these commands to deploy the K8s EKS cluster:

1. **Initialize the Terraform configuration:**
    ```bash
    terraform init
    ```

2. **Create an execution plan and save it to a file:**
    ```bash
    terraform plan -out=myplan
    ```

3. **Apply the execution plan to deploy the resources:**
    ```bash
    terraform apply myplan
    ```

### Test and Verify Our Cluster Deployment

Here are some commands that we can use to test and verify your EKS cluster:

1. **Check the nodes in the cluster:**
    ```bash
    kubectl get nodes
    ```

2. **Check the pods running in the kube-system namespace:**
    ```bash
    kubectl get pods -n kube-system
    ```

3. **Check the services running in the kube-system namespace:**
    ```bash
    kubectl get svc -n kube-system
    ```

4. **Check the cluster information:**
    ```bash
    kubectl cluster-info
    ```

5. **Describe the EKS cluster:**
    ```bash
    eksctl get cluster --name my-eks-cluster
    ```

### Question 2: Run a “Hello-World” Container

A container with any webserver technology should be deployed to the cluster. The webserver should be accessible through the challenger's browsers and display a simple webpage with a "Hello World" message.

- For this task, I will deploy a “Hello-World” container using the NGINX web server technology. To achieve this, I will create a Kubernetes deployment using a YAML file named `webserver-deployment.yaml`.

#### File: **`webserver-deployment.yaml`**

### Applying the Deployment

Please run these commands to deploy the “Hello-World” Container:

1. **Apply the deployment configuration:**
    ```bash
    kubectl apply -f webserver-deployment.yaml
    ```

2. **Verify the deployment:**
    ```bash
    kubectl get deployments
    ```


