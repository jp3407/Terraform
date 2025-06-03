terraform {
}

provider "aws" {
    region = us-east-1
}

# force_destroy = true on an S3 bucket resource instructs Terraform to 
    #delete all objects within the bucket, including any objects that may be locked, before deleting the bucket itself. 
    #This allows Terraform to proceed with destroying the bucket even if it's not empty, 
    # which would otherwise prevent the operation
resource "aws_s3_bucket" "terraform-state" {
    bucket        = "tf-devops-tf-state"
    force_destroy = true
}

resource "aws_s3_bucket_versioning" "terraform_bucket_version" {
    bucket    = aws_s3_bucket.terraform_state.id
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_crypto_conf" {
    bucket  = aws_s3_bucket.terraform_state.bucket
    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256" # Valid Values: AES256 | aws:kms | aws:kms:dsse
        }
    }
}

resource "aws_dynamo_table" "terraform_locks" {
    name          = "terraform-state-locking"
    billing_mode  = "PAY_PER_REQUEST"
    hash_key      = "LockID"
    attribute     {
        name = "LockID"
        type = "S" #S = string N = number B = Binary
    }
}