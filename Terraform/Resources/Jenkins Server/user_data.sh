#!/bin/bash

sudo yum install wget -y
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat/jenkins.repo
rpm --import http://pkg.jenkins.io/redhat/jenkins.io.key
yum install jenkins -y
yum install java -y
systemctl start jenkins
chkconfig jenkins on
aws s3 cp s3://pemkeytw/mediawiki.pem /root
sudo ssh-keygen





