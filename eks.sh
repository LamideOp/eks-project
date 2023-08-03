#!/bin/bash
set -x

# provision vpc
cd ./vpc 
terraform fmt
terraform init
terraform plan
terraform apply --auto-approve
sleep 5

# spin up eks cluster and setup oidc and create role for CAS
cd ../cluster
terraform fmt
terraform init
terraform plan
terraform apply --auto-approve

#update the config file
aws eks --region us-east-1 update-kubeconfig --name demo

#deploy service account with oidc role attached
#cd ../../oidc
#kubectl apply -f .