#!/bin/bash
#
# Setup the the box. This runs as root

apt-get -y update
apt-get -y install software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get -y update
apt-get -y install curl git-core 
apt-get -y install bridge-utils vlan
apt-get -y install ansible

# You can install anything you need here.
