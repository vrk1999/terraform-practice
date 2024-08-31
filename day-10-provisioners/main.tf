provider "aws" {
  region = "eu-west-1"
}

resource "aws_key_pair" "example" {
  key_name = "NewKey"
  public_key = file()
}