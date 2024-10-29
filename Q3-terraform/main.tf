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

module "security_group" {
  source      = "./modules/security-group"
  environment = var.ENVIRONMENT
}
output "security_group_id" {
  description = "The ID of the created security group"
  value       = aws_security_group.app_sg.id
}


module "ec2" {
  source          = "./modules/ec2"
  environment     = var.ENVIRONMENT
  instance_type   = var.INSTANCE_TYPE
  ami_id          = var.AMI_ID
  user_data       = file(var.USER_DATA_SCRIPT_PATH)
  security_group_id = aws_security_group.app_sg.id  # Pass the security group ID directly
  instance_count  = var.INSTANCE_COUNT  # Number of EC2 instances
}

module "s3" {
  source      = "./modules/s3"
  environment = var.ENVIRONMENT
}
