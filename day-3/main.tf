#--------Creating VPC--------------#
resource "aws_vpc" "customvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "custom_vpc"
  }
}

#--------Creating internet gateway--------------#
resource "aws_internet_gateway" "igcustom" {
  vpc_id = aws_vpc.customvpc.id
  tags = {
    name = "ig"
  }
}

#--------Creating public subnet1--------------#
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.customvpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = var.availability_zone
  tags = {
    name = "public _subnet"
  }
}

#--------Creating public subnet2--------------#
resource "aws_subnet" "public_subnet2" {
  vpc_id            = aws_vpc.customvpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = var.availability_zone
  
  tags = {
    name = "public _subnet1"
  }
}

#--------Creating route table and attach to ig--------------#
resource "aws_route_table" "routetable" {
  vpc_id = aws_vpc.customvpc.id

  route {
    gateway_id = aws_internet_gateway.igcustom.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    name = "route_table1"
  }
}

#--------subnet association add subnets into RT--------------#
resource "aws_route_table_association" "name" {
  route_table_id = aws_route_table.routetable.id
  subnet_id      = aws_subnet.public_subnet.id
}

#--------Create a scurity group--------------#
resource "aws_security_group" "sg1" {
  name        = "allowtraffic"
  vpc_id      = aws_vpc.customvpc.id
  description = "allow traffic"
  tags = {
    name = "allowTraffic"
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

#--------Create a launch Instance--------------#

resource "aws_instance" "ec2" {
  ami                    = var.ami
  instance_type          = var.type
  key_name               = var.key_name
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg1.id]

  tags = {
    name = "public_ec2"
  }
}