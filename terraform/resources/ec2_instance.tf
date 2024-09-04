resource "aws_instance" "app_server" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [module.security_group.security_group_id]

  tags = {
    Name = "MyAppServer"
  }
}