output "ec2" {
  value = ["${aws_instance.ec2.*.id}"]
}

output "ec2_ssh_sg" {
  value = "${aws_security_group.ec2_ssh_sg.id}"
}

output "ec2_sg" {
  value = "${aws_security_group.ec2_sg.id}"
}

output "jenkins_test_user_access_key_id" {
  value = "${aws_iam_access_key.jenkins_access_key.id}"
}

output "jenkins_test_user_secret" {
  value = "${aws_iam_access_key.jenkins_access_key.encrypted_secret}"
}
