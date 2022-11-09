terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "/home/ubuntu/.aws/credentials"
}

resource "aws_instance" "LB" {
  ami                         = "ami-0ac8def3123eedf5c"
  instance_type               = "t2.micro"
  private_ip                  = "192.168.0.11"
  subnet_id = "subnet-08059d8f0d29f83a2"
  associate_public_ip_address = true
  key_name = "tf-key-pair"

  tags = {
    Name = "LB"
  }
}
resource "aws_instance" "WEB" {
  ami                         = "ami-0ac8def3123eedf5c"
  instance_type               = "t2.micro"
  private_ip                  = "192.168.0.12"
  subnet_id = "subnet-08059d8f0d29f83a2"
  associate_public_ip_address = true
  key_name = "tf-key-pair"

  tags = {
    Name = "WEB"
  }
}
resource "aws_instance" "DB" {
  ami                         = "ami-0ac8def3123eedf5c"
  instance_type               = "t2.micro"
  private_ip                  = "192.168.0.13"
  subnet_id = "subnet-08059d8f0d29f83a2"
  associate_public_ip_address = true
  key_name = "tf-key-pair"

  tags = {
    Name = "DB"
  }
}
