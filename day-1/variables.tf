variable "ami" {
    description = "inserting ami values to main.tf"
    type = string
    default = "ami-0a2202cf4c36161a1"
}

variable "type" {
    description = "ec2 type"
    type = string
    default = "t2.micro"
}

variable "key_name" {
    description = "key pair"
    type = string
    default = "Newkey"
  
}