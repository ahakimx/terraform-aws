# terraform-aws

### Overview
This repo is a guide for provisioning AWS resources using Terraform.

#### Requirements
- Install terraform on your machine, tutorials [here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- AWS Account (can use [free tier](https://aws.amazon.com/free/))
#### Guide

`cd [directory_you_want]` # select directory you want, and use the below command:
```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

##### Example:
Provisioning EC2 with terraform.
```bash
cd ec2
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```