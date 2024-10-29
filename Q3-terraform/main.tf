provider "aws" {
  region  = var.AWS_REGION
  profile = var.AWS_PROFILE
}

## tfstate storage
terraform {
  backend "s3" {
    profile = "[your aws cli profile name]"
    bucket  = "[s3-bucket-name]"
    region  = "[region]"
    key     = "state/terraform.tfstate" 
  }
}

module "vpc" {
  source = "./modules/vpc"
  cidr_block          = var.VPC_CIDR_BLOCK
  public_subnet_cidr = var.PUBLIC_SUBNET_CIDR
  private_subnet_cidr = var.PRIVATE_SUBNET_CIDR
  availability_zone   = var.AVAILABILITY_ZONE
  environment         = var.ENVIRONMENT
}

module "security_group" {
  source      = "./modules/security-group"
  environment = var.ENVIRONMENT
  vpc_id      = module.vpc.vpc_id  # Reference VPC output
}

module "ec2" {
  source              = "./modules/ec2"
  environment         = var.ENVIRONMENT
  instance_type       = var.INSTANCE_TYPE
  ami_id              = var.AMI_ID
  user_data           = file(var.USER_DATA_SCRIPT_PATH)
  security_group_id   = module.security_group.security_group_id  # Reference security group output
  public_subnet_id    = module.vpc.public_subnet_id  # Reference public subnet output
  private_subnet_id   = module.vpc.private_subnet_id  # Reference private subnet output
  public_instance_count = var.PUBLIC_INSTANCE_COUNT  # Number of public EC2 instances
  private_instance_count = var.PRIVATE_INSTANCE_COUNT  # Number of private EC2 instances
}

module "s3" {
  source      = "./modules/s3"
  environment = var.ENVIRONMENT
  acl         = "private"  # You can set this or override it in terraform.tfvars
}
output "s3_bucket_name" {
  value = module.s3.bucket_name
}

