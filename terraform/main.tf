provider "aws" {
  region = var.aws_region
}

module "resources" {
  source = "./resources"
  
  instance_type = var.instance_type
  ami           = var.ami
  key_name      = var.key_name
}