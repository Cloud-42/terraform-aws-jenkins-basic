#!/bin/bash
set -ex
_install_jenkins() {
hostnamectl set-hostname ${appliedhostname}.${domain_name}
echo $(hostname -I | cut -d\  -f1) $(hostname) | sudo tee -a /etc/hosts
# Install latest Java
apt-get update -y
apt-get install default-jdk -y
# Install unattended-upgrade and upgrade any security patches
apt-get install unattended-upgrades -y
unattended-upgrade -d -v
# Install Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sh -c 'echo deb https://pkg.jenkins.io/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
/usr/bin/apt-get update -y
/usr/bin/apt-get install jenkins -y
}

_install_jenkins
