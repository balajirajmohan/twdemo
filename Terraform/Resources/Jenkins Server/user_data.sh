#!/bin/bash

#sudo yum install wget -y
#wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat/jenkins.repo
#rpm --import http://pkg.jenkins.io/redhat/jenkins.io.key
#yum install jenkins -y
#yum install java -y
#systemctl start jenkins
#chkconfig jenkins on
#sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
#sudo yum install jq -y
#sudo yum install unzip -y
#curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip
#unzip awscliv2.zip
#sudo ./aws/install -i /usr/local/aws-cli -b /usr/sbin
#rm -rf aws/ awscliv2.zip

sudo yum -y update
sudo yum install java-1.8.0 -y 
sudo yum remove java-1.7.0-openjdk -y
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins -y
sudo service jenkins start
sudo chkconfig --add jenkins
sudo amazon-linux-extras install ansible2
sudo yum install git -y
sudo git clone https://github.com/balajirajmohan/pemrepo.git
sudo mv /pemropo/mediawiki.pem /root




