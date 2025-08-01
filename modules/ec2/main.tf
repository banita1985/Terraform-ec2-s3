resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = "POC29-Ec2"
  }
}

output "instance_id" {
  value = aws_instance.web.id
}

variable "ami_id" {}
variable "instance_type" {}
variable "subnet_id" {}
