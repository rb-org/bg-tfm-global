terraform {
  #  required_version = "0.11.2"

  backend "s3" {
    bucket  = "bg-tfm-state"
    region  = "eu-west-1"
    key     = "bg-ec2.tfstate"
    encrypt = "true"
  }
}

// Remote state from dev ec2 plan
data "terraform_remote_state" "d202_nwk" {
  backend = "s3"

  config {
    region = "${var.region}"
    bucket = "bg-tfm-state"
    key    = "env:/d202/bg-base.tfstate"
  }
}
