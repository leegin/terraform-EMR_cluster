resource "aws_redshift_cluster" "Redshift_cluster" {
  cluster_identifier = "${var.cluster_identifier}"
  database_name      = "${var.database_name}"
  master_username    = "${var.username}"
  master_password    = "${var.password}"
  node_type          = "${var.node_type}"
  cluster_type       = "${var.cluster_type}"
  cluster_subnet_group_name = "${var.subnet_id}"
  skip_final_snapshot = true
  iam_roles = "${var.redshift_role}"
  }
}
