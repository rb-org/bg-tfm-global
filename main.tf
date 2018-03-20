provider "aws" {
  region              = "${var.region}"
  allowed_account_ids = ["${var.acc_id}"]
}

module "ec2" {
  source = "./ec2"

  name_prefix          = "${var.name_prefix}"
  region               = "${var.region}"
  default_tags         = "${var.default_tags}"
  environment          = "${var.environment}"
  key_name             = "${var.key_name}"
  vpc_id               = "${data.terraform_remote_state.d202_nwk.vpc_id}"
  vpc_cidr             = "${data.terraform_remote_state.d202_nwk.vpc_cidr}"
  iam_instance_profile = "${module.iam.default_profile_name}"
  ssh_ami_id           = "${var.ssh_ami_id}"
  rndk_ami_id          = "${var.rndk_ami_id}"
  allowed_ips          = "${var.allowed_ips}"
  private_subnets      = ["${data.terraform_remote_state.d202_nwk.private_subnet_ids}"]
  public_subnets       = ["${data.terraform_remote_state.d202_nwk.public_subnet_ids}"]
}

module "iam" {
  source = "./iam/"

  name_prefix = "${var.name_prefix}"
}
