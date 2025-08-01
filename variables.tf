variable "aws_region" {
  default = "eu-central-1"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  default     = "ami-0a87a69d69fa289be"  # ubuntu AMI in eu-central-1
}
