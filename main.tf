terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "vpc0" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "SB-VPC-Terraform"
  }
}

variable "common_cidr_block" {
  type = string
  default = "10.0.29.0/24"
}

resource "aws_subnet" "subnet0" {
  vpc_id     = aws_vpc.vpc0.id
  cidr_block = var.common_cidr_block

  tags = {
    Name = "SB-subnet"
  }
}

output "subnet0_id" {
  value = aws_subnet.subnet0.vpc_id
}
# resource "aws_vpc" "example" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name = "SB-Terraform-VPC"
#   }
# }

# resource "aws_subnet" "subnet0" {
#   vpc_id = aws_vpc.vpc0.id 
#   cidr_block = "10.0.1.0/24"

#   tags = {
#     Name = "SB-subnet"
#   }
# }