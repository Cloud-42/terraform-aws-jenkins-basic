output "ec2" {
  value = ["${aws_instance.ec2.*.id}"]
}

output "ec2_ssh_sg" {
  value = "${aws_security_group.ec2_ssh_sg.id}"
}

output "ec2_sg" {
  value = "${aws_security_group.ec2_sg.id}"
}
