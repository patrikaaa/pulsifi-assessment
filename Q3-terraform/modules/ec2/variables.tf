variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
}

variable "user_data" {
  description = "User data script for initializing the EC2 instance"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., sandbox, staging, production)"
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group to associate with the EC2 instance"
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet where EC2 instances will be launched"
  type        = string
}

variable "private_subnet_id" {
  description = "The ID of the private subnet where EC2 instances will be launched"
  type        = string
}

variable "public_instance_count" {
  description = "Number of public EC2 instances to create"
  type        = number
  default     = 1  # Default to 1 instance
}

variable "private_instance_count" {
  description = "Number of private EC2 instances to create"
  type        = number
  default     = 1  # Default to 1 instance
}
