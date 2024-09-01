resource "aws_instance" "ec2" {
  ami           = "ami-0a2202cf4c36161a1"
  instance_type = "t2.micro"
  key_name      = "Newkey"
  for_each = toset(var.test)

  tags = {
    Name = each.value
  }
}

variable "test" {
  type    = list(string)
  default = ["dev", "test", "prod"]
}