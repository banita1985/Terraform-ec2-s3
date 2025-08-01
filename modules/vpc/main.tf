resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  tags = {
    Name       = "terraform-vpc"
    CreatedBy  = "Terraform"
    Project    = "POC29"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name       = "terraform-subnet"
    CreatedBy  = "Terraform"
    Project    = "POC29"
  }
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_id" {
  value = aws_subnet.subnet.id
}

variable "cidr_block" {}
