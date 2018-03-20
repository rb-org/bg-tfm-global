variable "region" {}

variable "name_prefix" {
  default = "bg"
}

variable "environment" {}

variable "default_tags" {
  description = "Map of tags to add to all resources"
  type        = "map"

  default = {
    Terraform          = "true"
    GitHubRepo         = "bg-tfm-global"
    GitHubOrganization = "rb-org"
  }
}

variable "acc_id" {}

variable "key_name" {
  type = "map"
}

variable "ssh_ami_id" {
  type = "map"

  default = {
    eu-west-1 = "ami-1b791862"
  }
}

variable "rndk_ami_id" {
  type = "map"

  default = {
    eu-west-1 = "ami-1b791862"
  }
}

variable "allowed_ips" {
  type = "list"
}
