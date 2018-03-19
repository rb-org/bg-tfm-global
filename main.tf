provider "aws" {
  region              = "${var.region}"
  allowed_account_ids = ["${var.acc_id}"]
}

module "ec2" {
  source = "./ec2"

  name_prefix  = "${var.name_prefix}"
  region       = "${var.region}"
  default_tags = "${var.default_tags}"
  environment  = "${var.environment}"
}
