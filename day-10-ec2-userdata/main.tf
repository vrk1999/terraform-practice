resource "aws_instance" "dev" {
    ami = "ami-0a2202cf4c36161a1"
    instance_type = "t2.micro"
    availability_zone = "eu-west-1a"
    key_name = "Newkey"
    user_data = file("test.sh")
}