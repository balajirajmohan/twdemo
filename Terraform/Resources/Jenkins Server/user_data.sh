#!/bin/bash

sudo yum install wget -y
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat/jenkins.repo
rpm --import http://pkg.jenkins.io/redhat/jenkins.io.key
yum install jenkins -y
yum install java -y
systemctl start jenkins
chkconfig jenkins on
sudo yum install git -y
sudo git clone https://github.com/balajirajmohan/pemrepo.git
sudo mv /pemropo/mediawiki.pem /root




