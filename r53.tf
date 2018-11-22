#--------------------------------------------------------------------
# Route 53 entry per host
#--------------------------------------------------------------------

resource "aws_route53_record" "hosts" {
  # same number of records as instances

  count   = "${var.count}"
  zone_id = "${var.zone_id}"
  name    = "${var.hostname_prefix}${format("%03d", count.index + 1 + var.hostname_offset)}"
  type    = "A"
  ttl     = "300"

  # matches up record  to instance N
  records = ["${element(aws_instance.ec2.*.private_ip, count.index)}"]
}

#--------------------------------------------------------------------
# Route 53 entry for the ALB
#--------------------------------------------------------------------

resource "aws_route53_record" "alb" {
  # Endpoint DNS record

  zone_id = "${var.zone_id}"
  name    = "jenkins"
  type    = "CNAME"
  ttl     = "300"

  # matches up record N to instance N
  records = ["${aws_lb.jenkins.dns_name}"]
}
