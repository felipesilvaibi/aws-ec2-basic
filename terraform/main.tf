provider "aws" {
  region = var.aws_region
}

module "security_group" {
  source = "./resources/aws_security_group"  # Corrige o caminho para o módulo aws_security_group
}

module "ec2_instance" {
  depends_on = [ module.security_group ]  # Garante que o security group seja criado antes da instância
  
  source = "./resources/aws_instance"  # Corrige o caminho para o módulo aws_instance
  
  instance_type = var.instance_type
  ami           = var.ami
  key_name      = var.key_name
}