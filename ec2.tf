#---------------------------------------------------------------
# Creates ec2
#---------------------------------------------------------------
resource "aws_instance" "ec2" {
  depends_on = ["aws_security_group.ec2_sg"]

  availability_zone = "${element(split(",", var.availability_zones), count.index)}"
  key_name          = "${var.key_name}"
  subnet_id         = "${element(split(",", var.private_subnets), count.index)}"
  count             = "${var.count}"
  instance_type     = "${var.instance_type}"

  root_block_device {
    volume_type = "gp2"
    volume_size = "${var.root_volume_size}"
  }

  user_data = "${element(data.template_file.userdata.*.rendered, count.index)}"

  #
  # Apply userdata only once. Ignore AMI changes.
  #  
  lifecycle {
    ignore_changes = ["ami", "user_data"]
  }

  ami = "${data.aws_ami.ubuntuserver_ami.id}"

  vpc_security_group_ids = ["${aws_security_group.ec2_sg.id}", "${aws_security_group.ec2_ssh_sg.id}"]
  iam_instance_profile   = "${aws_iam_instance_profile.ec2_profile.id}"

  #-----------------------------------------------------------------
  # Tags
  #-----------------------------------------------------------------
  tags {
    Name            = "${var.environment}_jenkins_ec2"
    "Environment"   = "${var.environment}"
    "Contact"       = "${var.contact}"
    "Orchestration" = "${var.orchestration}"
  }
}

# User data rendered

data "template_file" "userdata" {
  template = "${file("${path.module}/userdata.sh")}"
  count    = "${var.count}"

  vars {
    appliedhostname = "${var.hostname_prefix}${format("%03d", count.index + 1 + var.hostname_offset)}"
    domain_name     = "${var.domain_name}"
    environment     = "${var.environment}"
  }
}
