terraform {
  backend "s3" {
    bucket = "storethestate"
    key    = "state/s3-module/terraform.tfstate"
    region = "eu-central-1"
  }
}


provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
}

module "s3" {
  source = "./modules/s3"
}


resource "random_id" "bucket_id" {
  byte_length = 4
}

module "ec2" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id
  instance_type = "t2.micro"
  subnet_id     = module.vpc.subnet_id
}
