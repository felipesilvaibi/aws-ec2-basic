provider "aws" {
  region = var.aws_region
}

module "ec2_instance" {
  source = "./resources/aws_instance"
}

module "security_group" {
  source = "./resources/aws_security_group"
}
