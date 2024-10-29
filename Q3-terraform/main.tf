provider "aws" {
  region  = var.AWS_REGION
  profile = var.AWS_PROFILE
}

terraform {
  backend "s3" {
    profile = "[your local aws profile name]"
    bucket  = "[s3-bucket-name]"
    region  = "[region]"
    key     = "state/terraform.tfstate" 
  }
}

module "ec2" {
  source        = "./modules/ec2"
  environment   = var.ENVIRONMENT
  instance_type = var.INSTANCE_TYPE
  ami_id        = var.AMI_ID
  user_data     = file("path/to/your/user_data_script.sh")
}

module "s3" {
  source      = "./modules/s3"
  environment = var.ENVIRONMENT
}

module "security_group" {
  source      = "./modules/security-group"
  environment = var.ENVIRONMENT
}
