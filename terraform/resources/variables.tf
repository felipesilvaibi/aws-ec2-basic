variable "instance_type" {
  description = "Type of instance to be created"
  default     = "t2.micro"
}

variable "ami" {
  description = "Amazon Machine Image ID to be used"
  default     = "ami-0c55b159cbfafe1f0"  # Alterar conforme necessário
}

variable "key_name" {
  description = "SSH key name for EC2 instance"
  sensitive   = true  # Evita que o nome da chave seja exposto nos logs
}