variable "cluster_name" {
   default = "EMR-cluster"
}

variable "release" {
   default = "emr-5.9.0"
}

variable "applications" {
   default = ["Spark"]
   type    = "list"
}

variable "s3_bucket" {}

variable "root_volume_size" {}

variable "subnet_id" {}

variable "emr_master" {}

variable "emr_slave" {}

variable "instance_profile" {}

variable "ssh_key_name" {}

variable "master_instance_type" {}

variable "core_instance_type" {}

variable "core_instance_count_min" {}

variable "core_instance_count_max" {}

variable "core_volume_size" {}

variable "region" {}

variable "certs_s3_object" {}

variable "kms_key_id" {}

variable "zeppelin_port" {}

variable "zeppelin_keystore_password" {}

variable "bootstrap_script_s3_object" {}

variable "autoscaling_role" {}

variable "service_role" {}
