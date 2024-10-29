resource "aws_instance" "public_app" {
  count         = var.public_instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  user_data     = var.user_data
  subnet_id     = var.public_subnet_id  # Use public subnet
  
  vpc_security_group_ids = [var.security_group_id]  # Reference security group ID

  tags = {
    Name = "${var.environment}-public-ec2-instance-${count.index + 1}"
  }
}

resource "aws_instance" "private_app" {
  count         = var.private_instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  user_data     = var.user_data
  subnet_id     = var.private_subnet_id  # Use private subnet

  vpc_security_group_ids = [var.security_group_id]  # Reference security group ID

  tags = {
    Name = "${var.environment}-private-ec2-instance-${count.index + 1}"
  }
}
