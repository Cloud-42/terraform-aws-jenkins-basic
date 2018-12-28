#!/bin/bash
#
# Set hostname, ensure it remains
#
hostnamectl set-hostname ${appliedhostname}.${domain_name}
#
#  Create initial hostname entry to remove: 
#  'unable to resolve host ubuntu' error
#
echo $(hostname -I | cut -d\  -f1) $(hostname) | sudo tee -a /etc/hosts
#
# Install latest Java
#
apt-get update -y
apt-get install default-jdk -y
#
# Install unattended-upgrade and upgrade any security patches
#
apt-get install unattended-upgrades -y
unattended-upgrade -d -v
#
# Install Jenkins
#
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sh -c 'echo deb https://pkg.jenkins.io/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update -y 
apt-get install jenkins -y
