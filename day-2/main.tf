resource "aws_instance" "test-ec2" {
  ami           = var.ami
  instance_type = var.type
  key_name      = var.key_name
  tags = {
    Name = "test"
  }

}