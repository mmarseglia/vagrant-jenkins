#!/bin/bash

###########################################################
ANSWERS=$1

iptables -F INPUT
iptables -F OUTPUT

## Add host entries for each system
cat > /etc/hosts <<EOH
127.0.0.1 localhost localhost.localdomain localhost4 localhost4.localdomain
::1 localhost localhost.localdomain localhost6 localhost6.localdomain
192.168.138.10 jenkins.vagrant.vm jenkins
192.168.138.14 node.vagrant.vm node 
EOH

# install git, java. required on both VMs
sudo yum install git java-1.6.0-openjdk

# Bootstrap the master
if [ "$1" == 'master' ]; then
	sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
	sudo rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
	sudo yum -y install jenkins 
	sudo chkconfig --add jenkins
	sudo chkconfig jenkins on
	sudo service jenkins start
fi
