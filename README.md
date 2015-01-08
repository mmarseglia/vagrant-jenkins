#Vagrant and Jenkins Master, Node

##Overview
This repository will vagrant up a Jenkins Master and Node for testing.

##Files/Directories

###provision/provision.sh
Shell script to install Jenkins and required packages.

###vagrant.yaml
YAML file that defines our virtual machines for Vagrant

##Usage
* vagrant up
* point web browser to http://192.168.137.14:8080/
* configure jenkins node 192.168.137.15 with the master

