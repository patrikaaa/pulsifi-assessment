variable "AWS_REGION" {
  description = "The AWS region to deploy the resources in"
  type        = string
}

variable "AWS_PROFILE" {
  description = "The AWS CLI profile to use for authentication"
  type        = string
}

variable "VPC_CIDR_BLOCK" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "PUBLIC_SUBNET_CIDR" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "PRIVATE_SUBNET_CIDR" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "AVAILABILITY_ZONE" {
  description = "The availability zone for the subnets"
  type        = string
}

variable "ENVIRONMENT" {
  description = "Deployment environment (e.g., sandbox, staging, production)"
  type        = string
}

variable "INSTANCE_TYPE" {
  description = "The instance type for the EC2 instances"
  type        = string
}

variable "AMI_ID" {
  description = "The AMI ID for the EC2 instances"
  type        = string
}

variable "USER_DATA_SCRIPT_PATH" {
  description = "Path to the user data script for initializing the EC2 instances"
  type        = string
}

variable "PUBLIC_INSTANCE_COUNT" {
  description = "Number of public EC2 instances to create"
  type        = number
  default     = 1  # Default to 1 instance
}

variable "PRIVATE_INSTANCE_COUNT" {
  description = "Number of private EC2 instances to create"
  type        = number
  default     = 1  # Default to 1 instance
}