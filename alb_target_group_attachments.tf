#--------------------------------------------------------------------
# Target Group attachment
#--------------------------------------------------------------------
resource "aws_alb_target_group_attachment" "svc_physical_external" {
  target_group_arn = "${aws_lb_target_group.alb_target_group.arn}"
  target_id        = "${aws_instance.ec2.id}"
  port             = 8080
}
