resource "aws_instance" "ec2" {
  ami                    = "ami-0a2202cf4c36161a1"
  instance_type          = "t2.micro"
  key_name               = "Newkey"
  subnet_id              = data.aws_subnet.selected.id
  tags = {
    name = "public_ec2"
  }
}

data "aws_subnet" "selected" {
    id = "subnet-04af06a68615d0390"
}