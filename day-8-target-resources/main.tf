resource "aws_instance" "name" {
    ami      = "ami-0a2202cf4c36161a1"
instance_type =      "t2.micro"
key_name = "Newkey"
}

resource "aws_s3_bucket" "name" {
  bucket = "vrknewbucketawstraining"
}
# if only one resource out of many wants to be created, use the below command,
# ex: terraform apply --target=aws_s3_bucket.name
# to delete - terraform destroy --target=aws_s3_bucket.name