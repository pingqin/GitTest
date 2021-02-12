terraform {
  required_version = ">= 0.12.0"
}
provider "aws" {
 # version = ">= 2.28.1"
  region  = "us-east-1"
}
resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"
  tags = {
    Name = "tf-example"
  }
}
