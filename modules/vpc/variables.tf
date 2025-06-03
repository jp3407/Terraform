variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_name" {
  type    = string
  default = "demo_vpc_1"
}
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "private_subnets" {
  type = map(object({
    cidr_index = number
    az         = string
  }))
}

variable "public_subnets" {
  type = map(object({
    cidr_index = number
    az         = string
  }))
}

 