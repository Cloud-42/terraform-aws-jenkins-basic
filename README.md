# Basic Jenkins implementation on AWS.

Creates a basic Jenkins implementation running on an Ubuntu ec2 server. Creates an ALB which sits in front of the Jenkins server to provide a secure endpoint. Standard implementation is to have the Jenkins host running in a private subnet, traffic is then routed to it via the ALB. The ALB can be public facing ( placed in a public subnet ) or privately available ( placed in a private subnet ). If the ALB is privately available, Direct Connect or a VPN connection to the private subnets is required to facilitate routing of any traffic.

##### Standard items created:

 * ec2 server with Jenkins installed
 * ALB available via HTTPS
 * Standard tags added to resources: Name, environment, orchestration.

##### Optional items:

 * None

##### Current supported Operating Systems:

 * Ubuntu 16

##### Assumptions:

 * None

