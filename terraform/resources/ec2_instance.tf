resource "aws_instance" "ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.security_group.id]

  tags = {
    Name = "MyAppServer"
  }
}