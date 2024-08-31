module "ec2" {
  source = "../day-2"
  ami = var.ami
  type = var.type
  key_name = "NewAws"
}
