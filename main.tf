
provider "aws" {
region = "ap-south-1"
access_key = "AKIA6HZPVPGXWQCSAD4Z"
secret_key = "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"
}


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
  ami           = "ami-09f7fbc41963e146f"
  instance_type = "t2.medium"
  subnet_id = aws_subnet.two.id
  tags = {
    Name = "${local.staging_env}-instance"
  }
}


