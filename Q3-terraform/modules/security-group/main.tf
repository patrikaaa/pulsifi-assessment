resource "aws_security_group" "app_sg" {
  name        = "${var.environment}-app-sg"
  description = "Security group for EC2 instances"
  vpc_id      = "your_vpc_id"  # Adjust as necessary

  ingress {
    from_port   = 22  # Allow SSH access
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80  # Allow HTTP access
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-security-group"
  }
}
