<p align="center">
  <a href="https://www.cloud42.io/" target="_blank" rel="Homepage">
  <img width="200" height="200" src="https://www.cloud42.io/wp-content/uploads/2020/01/transparent_small.png">
  </a>
</p>

---
<p align="center">Need help with your Cloud builds <a href="https://www.cloud42.io/contact/" target="_blank" rel="ContactUS"> DROP US A LINE</a>.</p>

---
# Basic Jenkins implementation on AWS.

Creates a basic Jenkins implementation running on an Ubuntu ec2 server. Creates an ALB which sits in front of the Jenkins server to provide a secure endpoint. Standard implementation is to have the Jenkins host running in a private subnet, traffic is then routed to it via the ALB. The ALB can be public facing ( placed in a public subnet ) or privately available ( placed in a private subnet ). If the ALB is privately available, Direct Connect or a VPN connection to the private subnets is required to facilitate routing of any traffic. An encrypted s3 bucket is also created , to which the Jenkins ec2 host has access, which can be used to host files and resources that Jenkins will use.

##### Standard items created:

 * ec2 server with Jenkins installed.
 * 3x Security Groups "SG" - SSH ec2 SG, Access to ec2 SG, ALB SG.
 * ALB, available via HTTPS.
 * Standard tags added to resources: Name, environment, orchestration.
 * Custom KMS encryption key.
 * s3 bucket - encrypted with the custom KMS Key - versioning enabled.
 * Hostname A record in Route53, eg jenkinshost001.domain.io -> 10.1.1.2
 * Endpoint CNAME ( alias ) record in Route53, eg jenkins.domain.io -> internal-dev-18271620561.us-east-1.elb.amazonaws.com 

##### Optional items:

 * None

##### Current supported Operating Systems:

 * Ubuntu 16

##### Assumptions:

 * A VPC is already in place
 * Route 53 zone is already in place
 * Terraform version >= 0.11.10
