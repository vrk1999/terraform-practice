resource "aws_instance" "name" {
  ami           = "ami-0a2202cf4c36161a1"
  instance_type = "t2.micro"
  key_name      = "Newkey"
  depends_on = [ aws_s3_bucket.name ]
}

resource "aws_s3_bucket" "name" {
  bucket     = "vrknewbucketawstraining123"
}