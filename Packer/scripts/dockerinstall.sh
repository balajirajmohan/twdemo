#To Install Docker CE in Host Machine where we deploy our containers
sudo amazon-linux-extras install docker -y

#To Start the docker Service
sudo systemctl start docker

#Adding Docker Permissions for EC2-User
sudo usermod -a -G docker ec2-user

#Make Docker Auto start
sudo chkconfig docker on

#Install Git
sudo yum install git -y

#Add jenkins user to run Docker commands
#sudo usermod -a -G docker jenkins




