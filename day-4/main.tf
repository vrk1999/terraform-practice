resource "aws_s3_bucket" "new" {
  bucket = "vrk-aws-trainings"
}

resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.new.id
  versioning_configuration {
    status = "Enabled"
  }
}