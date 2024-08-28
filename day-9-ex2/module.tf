module "test" {
  source = "../day-3"
  ami = "ami-0a2202cf4c36161a1"
  type = "t2.micro"
  key_name = "Newkey"
}