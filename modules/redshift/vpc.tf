resource "aws_redshift_subnet_group" "redshift_subnet_group" {
  name       = "redshift-subnet-group"
  subnet_ids = "${var.subnet_id}"

tags = {
    Name = "redshift-subnet-group"
  }
}
