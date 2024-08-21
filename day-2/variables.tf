variable "ami" {
  description = "inserting ami values to main.tf"
  type        = string
  default     = ""
}

variable "type" {
  description = "ec2 type"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "key pair"
  type        = string
  default     = ""

}