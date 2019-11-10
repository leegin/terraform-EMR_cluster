resource "aws_security_group" "emr_master" {
  name = "${var.cluster_name}-master"
  vpc_id      = "${var.vpc_id}"
  revoke_rules_on_delete = true

  # Allow communication between nodes in the VPC
  ingress {
    from_port   = "${var.ingress_fromport1}"
    to_port     = "${var.ingress_toport1}"
    protocol    = "-1"
    self        = true
  }

  ingress {
      from_port   = "${var.ingress_fromport2}"
      to_port     = "${var.ingress_toport2"
      protocol    = "TCP"
  }

  egress {
    from_port   = "${var.egress_fromport1}"
    to_port     = "${var.engress_toport1}"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    ignore_changes = ["ingress", "egress"]
  }

  tags {
    name        = "sg-emr_Master"
  }
}


resource "aws_security_group" "emr_slave" {
  name = "${var.cluster_name}-slave"
  vpc_id      = "${var.vpc_id}"
  revoke_rules_on_delete = true

  # Allow communication between nodes in the VPC
  ingress {
    from_port   = "${var.ingress_fromport1}"
    to_port     = "${var.ingress_toport1}"
    protocol    = "-1"
    self        = true
  }

  ingress {
      from_port   = "${var.ingress_fromport2}"
      to_port     = "${var.ingress_toport2"
      protocol    = "TCP"
  }

  egress {
    from_port   = "${var.egress_fromport1}"
    to_port     = "${var.engress_toport1}"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    ignore_changes = ["ingress", "egress"]
  }

  tags {
    name        = "sg-emr_Slave"
  }
}
