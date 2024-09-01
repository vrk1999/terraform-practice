provider "aws" {
    region = "eu-west-1"
}

provider "aws" {
    region = "ap-south-1"
    alias = "mumbai"
}

resource "aws_s3_bucket" "name" {
    bucket = "testbucketinireland"
}

resource "aws_s3_bucket" "mumbai" {
    bucket = "testbucketinmumbaiandheri"
    provider = aws.mumbai
}
