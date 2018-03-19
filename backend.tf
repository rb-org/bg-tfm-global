terraform {
  #  required_version = "0.11.2"

  backend "s3" {
    bucket  = "bg-tfm-state"
    region  = "eu-west-1"
    key     = "bg-global.tfstate"
    encrypt = "true"
  }
}
