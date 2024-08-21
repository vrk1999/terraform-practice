resource "aws_instance" "name" {
  count = 10
  ami = var.ami
  instance_type = var.type
  key_name = var.key_name
}