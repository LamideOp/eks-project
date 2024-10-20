
# EKS Cluster Provisioning Repository

This repository contains Terraform scripts and configuration files to automate the provisioning of an Amazon EKS (Elastic Kubernetes Service) cluster along with the required VPC setup and IAM configurations. The process is managed using a Bash script (`eks.sh`) to streamline the deployment across multiple stages.

## Repository Structure

The repository is organized into the following directories:

- **`vpc/`**: Contains Terraform configurations for setting up the Virtual Private Cloud (VPC) that will host the EKS cluster. This includes subnets, route tables, and other networking resources.
- **`cluster/`**: Contains Terraform scripts for provisioning the EKS cluster and setting up OpenID Connect (OIDC) integration, as well as creating IAM roles needed for cluster access and service accounts.
- **`oidc/`** (commented out in the script): Intended for deploying service accounts with associated OIDC roles using Kubernetes manifests.

## Deployment Steps

To provision the infrastructure, follow these steps:

1. **Ensure you have the necessary tools installed:**
   - [Terraform](https://www.terraform.io/downloads.html)
   - [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
   - [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

2. **Execute the Bash script:**

   ```bash
   ./eks.sh
   ```

   This script will:
   - Navigate to the `vpc` directory and provision the VPC using Terraform.
   - Move to the `cluster` directory to create the EKS cluster, set up OIDC, and configure IAM roles.
   - Update the kubeconfig file to allow interaction with the EKS cluster using `kubectl`.

3. **(Optional) Deploy OIDC Service Account:**
   
   The `oidc` directory (currently commented out in the script) can be used to deploy service accounts with roles attached via OIDC. Uncomment the relevant lines in `eks.sh` and run:

   ```bash
   cd oidc
   kubectl apply -f .
   ```

## Notes

- The script assumes the AWS region is set to `us-east-1`. Adjust as needed.
- Ensure you have appropriate AWS credentials configured to allow Terraform and AWS CLI operations.
- The process will automatically apply the Terraform changes without requiring manual approval (`--auto-approve`).

Author: Samuel Okuneye
