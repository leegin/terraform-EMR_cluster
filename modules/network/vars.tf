variable "cluster_name" {
   default = "EMR-cluster"
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "tenancy" {}

variable "vpc_id" {}

variable "subnet_cidr" {
    default = "10.0.1.0/24"
}

variable "ingress_fromport1" {}

variable "ingress_toport1" {}

variable "ingress_fromport2" {}

variable "ingress_toport2" {}

variable "egress_fromport1" {}

variable "engress_toport1" {}
