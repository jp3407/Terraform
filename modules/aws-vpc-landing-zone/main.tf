# Deploy VPC
resource "aws_vpc" "landing-vpc" {
    tags       = merge(var.tags, {})
    cidr_block = var.vpc_cidr
}