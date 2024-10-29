variable "environment" {
  description = "Deployment environment (e.g., sandbox, staging, production)"
  type        = string
}

variable "acl" {
  description = "The canned ACL to apply to the bucket"
  type        = string
  default     = "private"  # Default to private access
}
