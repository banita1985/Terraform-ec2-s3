resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "s3bucket" {
  bucket = "terraform-created-bucket-banita-${random_id.bucket_suffix.hex}"
  force_destroy = true

  tags = {
    Name        = "terraform-created-bucket-banita-${random_id.bucket_suffix.hex}"
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.s3bucket.bucket
}
