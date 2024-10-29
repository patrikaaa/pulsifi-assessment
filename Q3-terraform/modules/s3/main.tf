resource "aws_s3_bucket" "this" {
  bucket = "${var.environment}-my-s3-bucket"
  acl    = var.acl

  tags = {
    Name        = "${var.environment}-s3-bucket"
  }
}

resource "random_string" "bucket_suffix" {
  length  = 6
  special = false
}

output "bucket_name" {
  value = aws_s3_bucket.this.bucket
}