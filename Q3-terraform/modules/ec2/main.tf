resource "aws_instance" "app" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  user_data     = var.user_data
  vpc_security_group_ids = [var.security_group_id]  # Reference security group ID
  
  tags = {
    Name = "${var.environment}-ec2-instance-${count.index + 1}"
  }
}
