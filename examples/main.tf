#
# The module is usually called from a 
# top level repository.
#
module "jenkins" {

  source = "git::https://github.com/Cloud-42/terraform-aws-jenkins-basic.git"

  trusted_security_groups = "sg-xyz1234"
  private_subnets         = "${module.vpc.subnets_private}"
  orchestration           = "${var.orchestration}"
  key_name                = "${var.key_name}"
  environment             = "${var.environment}"
  availability_zones      = "${var.availability_zones}"
  zone_id                 = "${module.vpc.zone_id}"
  vpc_id                  = "${module.vpc.vpc_id}"
  domain_name             = "${var.dns_domain}"

  #
  # ALB Vars
  #
  certificate_arn = "arn:aws:acm:us-east-1:1234567891:certificate/161897e5-15aw-43sw-1523-51b0f92d2b3a"
  subnets           = "${module.vpc.subnets_public}"
  target_group_path = "/login"
}
