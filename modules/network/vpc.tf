resource "aws_vpc" "main" {
    cidr_block = "${var.vpc_cidr}"
    instance_tenancy = "${var.tenancy}"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags {
        Name = "EMR_VPC"
    }
}

resource "aws_subnet" "emr-subnet" {
    vpc_id            = "${var.vpc_id}"
    cidr_block        = "${var.subnet_cidr}"

    tags {
        Name = "EMR_subnet"
    }
}
