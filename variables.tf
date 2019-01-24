variable "route53_endpoint_record" {
  description = "Route 53 endpoint name. Creates route53_endpoint_record.domain."
  default = "jenkins"
}
variable "count" {
  description = "Number of hosts to create"
  default     = "1"
}

variable "success_codes" {
  description = "Success Codes for the Target Group Health Checks. Default is 200 ( OK )"
  default     = "200"
}

variable "trusted_security_groups" {
  description = "Security Groups that are trusted for SSH access to the ec2 host. For example the SG of a Bastion server"
}

variable "certificate_arn" {
  description = "SSL certificate ARN"
}

variable "vpc_id" {
  description = "VPC id"
}

variable "environment" {
  description = "Environment deployed to. For example, DEV, UAT or PROD"
}

variable "key_name" {
  description = "SSH Key name"
}

variable "instance_type" {
  description = "Instance Type"
  default     = "t2.medium"
}

variable "root_volume_size" {
  description = "Root volume size for ec2 host"
  default     = "30"
}

variable "hostname_prefix" {
  description = "Hostname prefix for the Jenkins server"
  default     = "jenkinshost"
}

variable "hostname_offset" {
  description = "Hostname offset. Allows for hostname value to be started at a non zero point. For example hostname_offset=2 would result in the host being called jenkinshost003"
  default     = "0"
}

variable "domain_name" {
  description = "Domain Name"
}

variable "private_subnets" {
  description = "Private subnets"
}

variable "availability_zones" {
  description = "Availability Zones"
}

variable "zone_id" {
  description = "Route 53 zone id"
}

variable "orchestration" {
  description = "Link to the orchestration used. For example Bitbucket link."
}

variable "encrypted" {
  description = "Enables / Disables encryption of volumes"
  default     = "true"
}

# ---------------------------
# ALB Vars
# ---------------------------
variable "subnets" {
  description = "Subnets where the ALB will be placed"
}

variable "enable_deletion_protection" {
  description = "Enable / Disable deletion protection for the ALB."
  default     = "false"
}

variable "enable_cross_zone_load_balancing" {
  description = "Enable / Disable cross zone load balancing"
  default     = "false"
}

variable "internal" {
  description = "Is the ALB internal?"
  default     = "false"
}

variable "access_from" {
  description = "List of IPs that have access to the service / alb. Access can be controlled via this variable."
  default     = "0.0.0.0/0"
}

# Listener port and protocol need to match

variable "alb_listener_port" {
  description = "ALB listener port"
  default     = "443"
}

variable "alb_listener_protocol" {
  description = "ALB listener protocol"
  default     = "HTTPS"
}

variable "healthy_threshold" {
  description = "ALB healthy count"
  default     = "4"
}

variable "unhealthy_threshold" {
  description = "ALB unhealthy count"
  default     = "4"
}

variable "timeout" {
  description = "ALB timeout value"
  default     = "5"
}

variable "interval" {
  description = "ALB health check interval"
  default     = "10"
}

variable "svc_port" {
  description = "Service port: The port on which targets receive traffic."
  default     = "8080"
}

variable "target_group_path" {
  description = "Health check request path"
  default     = "/"
}

variable "target_group_protocol" {
  description = "The protocol to use to connect to the target"
  default     = "HTTP"
}

variable "target_group_port" {
  description = "The port to use to connect with the target"
  default     = "8080"
}
