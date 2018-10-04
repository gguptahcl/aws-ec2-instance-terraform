# Setting up EC2 instance

Purpose of this repository is to launch an EC2 instance and install docker , aws cli & terraform , aws iam Authenticator and Kubernetes Client.


### Prerequisities

1) Terrafform should be installed 
2) AWS IAM Role with access to IAM, EC2, Elastic Container Registry/Engine and it's access & secret keys. Profile must be set inside `~/.aws/credentials` directory.

### Contents of repo
 - ```*.tf``` files - Terraform infrastructure definition written in HCL (HashiCorp Configuration Language)


### Setup

1. Create `terraform.tfvars`  file and place variables inside this file.This file is not present in GIT Repo
	EC2_KEY_NAME="XXXXXXXX"

2. Run terraform init
3. Run terraform plan
4. Run terraform apply . This will pick up the plan file created in # 2 above and create an env. This step may take few minutes to complete.
5. #4 above will output EC2 Instance's Public IP address.
6. SSH into EC2 instance and execute following commands :
	aws configure  
	  

### Rollbacking setup
```
terraform destroy
```


