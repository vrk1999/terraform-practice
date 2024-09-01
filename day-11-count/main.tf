resource "aws_instance" "ec2" {
  ami           = "ami-0a2202cf4c36161a1"
  instance_type = "t2.micro"
  key_name      = "Newkey"
  count         = length(var.test) #start from zero index
  tags = {
    #Name = "public_ec2"
    #Name = "web-${count.index}"  #dynamically updating the name with count
    Name = var.test[count.index]
  }
}

variable "test" {
  type    = list(string)
  default = ["dev", "test", "prod"]
}