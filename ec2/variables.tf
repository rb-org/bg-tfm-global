variable "name_prefix" {}
variable "region" {}
variable "environment" {}

variable "key_name" {
  type = "map"
}

variable "vpc_id" {}
variable "vpc_cidr" {}
variable "iam_instance_profile" {}

variable "ssh_ami_id" {
  type = "map"
}

variable "rndk_ami_id" {
  type = "map"
}

variable "allowed_ips" {
  type = "list"
}

variable "default_tags" {}

variable "private_subnets" {
  type = "list"
}

variable "public_subnets" {
  type = "list"
}
