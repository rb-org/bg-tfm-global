// Security Group Resource for Bastion hosts
resource "aws_security_group" "sg_bastion" {
  name        = "${var.name_prefix}-glbl-sg-bstn"
  description = "Security Group ${var.name_prefix}-glbl-sg-bstn"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name        = "${var.name_prefix}-glbl-sg-bstn"
    Terraform   = "true"
    Environment = "${var.environment}"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

// allow traffic for TCP 22 (SSH)
resource "aws_security_group_rule" "allow_ssh_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${var.allowed_ips}"]
  security_group_id = "${aws_security_group.sg_bastion.id}"
}

// allow traffic for TCP 3389 (RDP)
resource "aws_security_group_rule" "allow_rdp_bastion" {
  type              = "ingress"
  from_port         = 3389
  to_port           = 3389
  protocol          = "tcp"
  cidr_blocks       = ["${var.allowed_ips}"]
  security_group_id = "${aws_security_group.sg_bastion.id}"
}

// Security Group for Rundek hosts

resource "aws_security_group" "sg_rundeck" {
  name        = "${var.name_prefix}-glbl-sg-rndk"
  description = "Security Group ${var.name_prefix}-glbl-sg-rndk"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name        = "${var.name_prefix}-glbl-sg-rndk"
    Terraform   = "true"
    Environment = "${var.environment}"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

// allow traffic for TCP 22 (SSH)
resource "aws_security_group_rule" "allow_ssh_rndk" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.sg_rundeck.id}"
  source_security_group_id = "${aws_security_group.sg_bastion.id}"
}
