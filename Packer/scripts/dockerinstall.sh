#To Install Docker CE in Host Machine where we deploy our containers
sudo amazon-linux-extras install docker -y

#To Start the docker Service
sudo service docker start

#Adding Docker Permissions for EC2-User
sudo usermod -a -G docker ec2-user

