provider "aws" {
  region = "us-west-1"
}

######
# VPC
######

module "vpc" {
   source = "./modules/network"
   vpc_cidr = "10.0.0.0/16"
   tenancy = "default"
   vpc_id = "${module.network.vpc_id}"
   subnet_cidr = "10.0.1.0/24"
}

###########################
# Security group
###########################

module "emr-sg" {
   source = "./modules/network"
   cluster_name = "EMR-CLUSTER"
   vpc_id = "${module.network.vpc_id}"
   ingress_fromport1 = "0"
   ingress_toport1 = "0"
   ingress_fromport2 = "8443"
   ingress_toport2 = "8443"
   egress_fromport1 = "0"
   engress_toport1 = "0"
}

#################
#IAM
################

module "emr-iam" {
  source = "./modules/network"
  cluster_name = "EMR-CLUSTER"
}

################
#SSH-KEYS
################

module "ssh-keys" {
  source = "./modules/network"
  cluster_name = "EMR-CLUSTER"
}

####
#S3
####

module "s3" {
  source = "./modules/s3"
  cluster_name = "EMR-CLUSTER"
  logging_bucket = ""
  region = "us-west-1"
}

#############
#EMR-CLUSTER
#############

module "emr" {
   source = "./modules/emr"
   zeppelin_port = "8893"
   zeppelin_keystore_password = ""
   s3_bucket = "${module.s3.bucket}"
   kms_key_id = ""
   certs_s3_object = ""
   cluster_name = "EMR-CLUSTER"
   core_instance_count_min = "1"
   core_instance_count_max = "3"
   release = "emr-5.13.0"
   applications = ["Spark", "Zeppelin", "Hive"]
   root_volume_size = "100"
   subnet_id = "${module.network.subnet_id}"
   emr_master = "${module.network.emr_master}"
   emr_slave = "${module.network.emr_slave}"
   instance_profile = "${module.network.instance_profile}"
   ssh_key_name = "${module.network.ssh_key_name}"
   master_instance_type = "r4.xlarge"
   core_instance_type = "r4.xlarge"
   core_volume_size = "100"
   region = "us-west-1"
   service_role = "${module.network.service_role}"
   autoscaling_role = "${module.network.autoscaling_role}"
}

############
#Redshift-sg
############

module "redshift-sg" {
  source = "./modules/redshift"
  vpc_id = "${module.network.vpc_id}"
  redshift-fromport = "5439"
  redshift-toport = "5439"
  cidr_blocks = "10.0.2.0/24"
  sg_name = "Redshift-sg"
}

#############
#Redshift VPC
#############

module "redshift-vpc" {
   source = "./modules/redshift"
   subnet_id = "${module.network.subnet_id}"
}

#################
#Redshift Cluster
#################

module "Redshift-cluster" {
  source = "./modules/redshift"
  cluster_identifier = "Redshift-cluster"
  database_name = "red-db"
  username = "reddbuser"
  password = "reddbpassword123#"
  node_type = "dc2.large"
  cluster_type = "single-node"
  subnet_id = "${module.network.subnet_id}"
  redshift_role = "${module.redshift.redshift_role}"
}
