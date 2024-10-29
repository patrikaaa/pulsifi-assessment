resource "aws_security_group" "app_sg" {
  name        = "${var.environment}-app-sg"
  description = "Security group for EC2 instances"
  vpc_id      = var.vpc_id  # Reference VPC ID

  ingress {
    from_port   = 22  # Allow SSH access (or change as needed)
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Adjust CIDR as needed for security
  }

  ingress {
    from_port   = 80  # Allow HTTP access (if needed)
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-security-group"
  }
}

output "security_group_id" {
  value = aws_security_group.app_sg.id
}
