variable "app_name" {}

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region"     { default = "us-east-1" }

variable "aws_vpc1_segment"                 { default = "172.26.0.0/16" }
variable "aws_vpc1_public_subnet1_segment"  { default = "172.26.1.0/24" }
variable "aws_vpc1_private_subnet1_segment" { default = "172.26.2.0/24" }

