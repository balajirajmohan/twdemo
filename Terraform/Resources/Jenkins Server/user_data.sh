#!/bin/bash

sudo yum install wget -y
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat/jenkins.repo
rpm --import http://pkg.jenkins.io/redhat/jenkins.io.key
yum install jenkins -y
yum install java -y
systemctl start jenkins
sudo yum install git -y
chkconfig jenkins on
yum  -y remove  docker-common docker container-selinux docker-selinux docker-engine
yum -y install lvm2 device-mapper device-mapper-persistent-data device-mapper-event device-mapper-libs device-mapper-event-libs
yum -y install  wget
wget https://download.docker.com/linux/centos/docker-ce.repo -O /etc/yum.repos.d/docker-ce.repo
sudo yum install -y yum install http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.107-1.el7_6.noarch.rpm
yum -y install docker-ce
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker root
sudo chmod 666 /var/run/docker.sock














