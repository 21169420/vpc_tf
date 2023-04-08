provider "aws" {
  region = "ap-south-1"
}

locals {
staging_env = "prod"
}

resource "aws_vpc" "one" {
cidr_block = "10.5.0.0/16"
tags = {
Name = "${local.staging_env}-vpc"
}
}

resource "aws_subnet" "two" {
vpc_id = aws_vpc.one.id
cidr_block = "10.5.0.0/16"
availability_zone = "ap-south-1a"
tags = {
Name = "${local.staging_env}-subnet"
}
}

resource "aws_instance" "three" {
  ami           = "ami-074dc0a6f6c764218"
  instance_type = "t2.medium"
  subnet_id = aws_subnet.two.id
  tags = {
    Name = "${local.staging_env}-instance"
  }
}


