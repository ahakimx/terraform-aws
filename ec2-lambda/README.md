#### Requirements
- Install terraform on your machine, tutorials [here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- AWS Account (can use [free tier](https://aws.amazon.com/free/))

#### Provisioning

```bash
git clone https://github.com/ahakimx/terraform-aws.git
cd terraform-aws/ec2-lambda
terraform init
terraform validate
terraform plan
terraform apply
```