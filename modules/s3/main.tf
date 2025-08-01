variable "bucket_name" {
  description = "The name of the S3 bucket to create"
  default     = "terraform-created-bucket-banita-${random_id.bucket_suffix.hex}"
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "private"

  tags = {
    Name      = var.bucket_name
    CreatedBy = "Terraform"
    Owner     = "banita"
    Purpose   = "State Storage"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.bucket.id
}
