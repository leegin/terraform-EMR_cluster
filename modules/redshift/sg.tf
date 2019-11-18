resource "aws_default_security_group" "redshift_security_group" {
  vpc_id     = "${var.vpc_id}"
  ingress {
    from_port   = "${var.redshift-fromport}"
    to_port     = "${var.redshift-toport}"
    protocol    = "tcp"
    cidr_blocks = "${var.cidr_blocks}"
  }
  tags= {
    name = "${var.sg_name}"
  }
}
