module "ec2_bastion_ssh" {
  source = "git@github.com:rb-org/terraform-aws-rb-ec2"

  region                  = "${var.region}"
  instance_name           = "${var.name_prefix}-glbl-ssh"
  instance_type           = "t2.medium"
  instance_count          = 1
  ami_id                  = "${var.ssh_ami_id[var.region]}"
  key_pair                = "${var.key_name[var.region]}"
  root_volume_type        = "gp2"
  root_volume_size        = 50
  user_data               = "./files/userdata.sh"
  subnet                  = ["${var.private_subnets}"]
  security_group          = ["${aws_security_group.sg_bastion.id}"]
  environment             = "${var.environment}"
  app_id                  = "ssh"
  app_role                = "bastion"
  chef_enabled            = true
  backup_enabled          = false
  public_ip               = true
  enable_monitoring       = true
  disable_api_termination = true
  instance_profile_name   = "${var.iam_instance_profile}"
}
