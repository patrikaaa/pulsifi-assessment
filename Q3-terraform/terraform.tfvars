# AWS values
AWS_REGION      = "ap-southeast-1a"                   # Specify your AWS region here
AWS_PROFILE     = "sandbox-profile"             # Specify your AWS CLI profile for this environment

# Environment values
ENVIRONMENT     = "sandbox"

# VPC values
VPC_CIDR_BLOCK       = "10.0.0.0/16"  # Change to unique CIDR
PUBLIC_SUBNET_CIDR   = "10.0.1.0/24"
PRIVATE_SUBNET_CIDR  = "10.0.2.0/24"
AVAILABILITY_ZONE     = "ap-southeast-1a"  # Adjust as needed

# EC2 instance values
INSTANCE_TYPE   = "t2.micro"
AMI_ID          = "ami-12345678"      
PUBLIC_INSTANCE_COUNT   = 1  # number of public EC2 instances
PRIVATE_INSTANCE_COUNT  = 1  # number of private EC2 instances

# Path for the user data script
USER_DATA_SCRIPT_PATH = "./modules/ec2/user_data_script.sh"  # Path to the user data script

