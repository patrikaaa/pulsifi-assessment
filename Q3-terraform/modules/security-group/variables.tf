variable "environment" {
  description = "Deployment environment (e.g., sandbox, staging, production)"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC to associate with the security group"
  type        = string
}