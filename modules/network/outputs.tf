output "subnet_id" {
   value = "${aws_subnet.emr-subnet.id}"
}

output "vpc_id" {
   value = "${aws_vpc.main.id}"
}


output "emr_master" {
    value = "${aws_security_group.emr_master.id}"
}

output "emr_slave" {
    value = "${aws_security_group.emr_slave.id}"
}

output "instance_profile" {
   value = "${aws_iam_instance_profile.emr_ec2_instance_profile.name"}

output "ssh_key_name" {
    value= "${aws_key_pair.key_pair.key_name}"
}

output "service_role" {
    value = "${aws_iam_role.emr_service_role.id}"
}

output "autoscaling_role" {
  value = "${aws_iam_role.autoscaling_role.id}"
}
