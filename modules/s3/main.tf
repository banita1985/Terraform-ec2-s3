resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  force_destroy = true  # Optional: allows auto-deletion even if bucket is not empty

  tags = {
    Name        = "terraform-created-bucket"
    Environment = "dev"
    CreatedBy   = "Terraform"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.bucket.id
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}
