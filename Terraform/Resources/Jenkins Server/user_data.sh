#!/bin/bash

sudo yum install wget -y
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat/jenkins.repo
rpm --import http://pkg.jenkins.io/redhat/jenkins.io.key
yum install jenkins -y
yum install java -y
systemctl start jenkins
sudo yum
chkconfig jenkins on
aws s3 cp s3://pemkeytw/mediawiki.pem /var/lib/jenkins/workspace
sudo ssh-keygen
sudo yum install -y yum install http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.107-1.el7_6.noarch.rpm -y
sudo yum install docker-ce -y
sudo systemctl start docker
sudo systemctl enable docker
sudo chmod 666 /var/run/docker.sock










