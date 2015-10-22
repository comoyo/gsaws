variable "aws_region" {
  description = "AWS region to launch servers."
  default = "eu-west-1"
}

variable "aws_access_key" { description = "the API access key" }
variable "aws_secret_key" { description = "the API secret key" }

variable "aws_key_name" {
  description = "Name of the SSH keypair to use in AWS."
  default = "deployer"
}

variable "timestamp" { }

variable "asg_min_size" {
  description = "Min size for application auto-scalling group"
  default = "1"
}

variable "asg_max_size" {
  description = "Max size for application auto-scalling group"
  default = "1"
}

variable "asg_desired_capacity" {
  description = "Desired capacity for application auto-scalling group"
  default = "1"
}

variable "aws_nat_amis" {
  description = "NAT AMI"
  default = {
    eu-west-1 = "ami-ef76e898"
    ap-southeast-1 = "ami-1a9dac48"
  }
}

# Ubuntu Precise 12.04 LTS (x64)
variable "aws_amis" {
    default = {
        eu-west-1 = "ami-47360a30"
        us-east-1 = "ami-de7ab6b6"
        us-west-1 = "ami-3f75767a"
        us-west-2 = "ami-21f78e11"
    }
}