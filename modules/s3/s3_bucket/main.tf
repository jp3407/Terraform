provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket_acl" "versioned_bucket" {
  bucket  = "tf-test-bucket"
  acl     = "private"
}