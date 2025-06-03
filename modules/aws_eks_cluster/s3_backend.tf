terraform {
  backend "s3" {
    bucket         = "tfstate-s3-bucket"             # S3 bucket for storing the state
    key            = "state/eks-terraform.tfstate"  # Create object directory structure dynamically
    region         = "us-east-2"                           # Region where the S3 bucket resides
    encrypt        = true                                   # Enable encryption for state file
    dynamodb_table = "terraform-lock-table"            # DynamoDB table for state locking
  }
}