module "ec2_rundeck" {
  source = "git@github.com:rb-org/terraform-aws-rb-ec2"

  region                  = "${var.region}"
  instance_name           = "${var.name_prefix}-glbl-rndk"
  instance_type           = "t2.medium"
  instance_count          = 1
  ami_id                  = "${var.rndk_ami_id[var.region]}"
  key_pair                = "${var.key_name[var.region]}"
  root_volume_type        = "gp2"
  root_volume_size        = 50
  user_data               = "./files/rundeck.sh"
  subnet                  = "${var.private_subnets}"
  security_group          = ["${aws_security_group.sg_rundeck.id}"]
  environment             = "${var.environment}"
  app_id                  = "rndk"
  app_role                = "rundeck"
  chef_enabled            = "true"
  backup_enabled          = "false"
  public_ip               = false
  enable_monitoring       = false
  disable_api_termination = false
  instance_profile_name   = "${var.iam_instance_profile}"
}
