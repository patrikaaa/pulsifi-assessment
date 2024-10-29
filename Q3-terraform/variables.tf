# AWS-specific variables
variable "AWS_REGION" {
  description = "The AWS region to deploy resources"
  type        = string
}

variable "AWS_PROFILE" {
  description = "The AWS CLI profile to use for deploying resources"
  type        = string
}

variable "ENVIRONMENT" {
  description = "Deployment environment (e.g., sandbox, staging, production)"
  type        = string
}

variable "INSTANCE_TYPE" {
  description = "The instance type for the EC2 instance"
  type        = string
}

variable "AMI_ID" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "USER_DATA_SCRIPT_PATH" {
  description = "Path to the user data script for EC2 instances"
  type        = string
}
