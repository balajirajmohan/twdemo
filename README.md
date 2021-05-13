# Thoughtworks - Mediawiki Application deployment using CI-CD pipeline

Tech Stacks Used:

1.CI/CD- Jenkins
2.Infra Provisioning- Terraform
3.Container Runtime- Docker
4.Image Artifcatory - DockerHub

steps to reproduce:
1. Login to AWS Console and Create an IAM user with Admin Role.
2. Download the .csv Crdentials
3. As a Best Practise, I have configured my Acess Key ID and Secret access key as a ENV Variables and added to the path so that it can support my Terraform and Packer deployments.



Tools Needs to be installed on Local Machine:

In my case, I have windows as my local machine and below are the instructions.

1. Packer - Download Scoop and Install Packer

   Open Powershell as admin and run  below commands CurrentUser followed by iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
   scoop install packer
   ```bash
   Set-ExecutionPolicy RemoteSigned -scope
   iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
   scoop install packer
   ```
   
   For Linux/Macos- https://www.packer.io/docs/install


2. Terraform - https://www.terraform.io/downloads.html -> Windows 64Bit and allow the download.
   unzip terraform.exe and add the AWS Access Key ID and secret access key to Windows Environment Variables.
   
   

Please follow the below steps for deploying the Docker Host via Packer:

1. Clone the Repo- git clone https://github.com/balajirajmohan/twdemo.git
2. Run the packer build from local machine (twdemo\Packer) path to setup Docker Host which is likely an Amazon Linux with Docker installed via Packer.

   ```bash
   packer build amibuild.json
   ```

Please follow the below steps for deploying the Jenkins Server Using Terraform:

1. From Local Machine, navigate to twdemo\Terraform folder and follow the below steps:

   ```bash
   terraform init 
   terraform validate
   terraform plan
   terraform apply --auto-approve
   ```


2. From Terraform appply output, Please copy the public ip of EC2 vm and 

   ```bash
   http://<Server-public-ip> to login to Server with port 8080
   ```
   
Establishing Connection between Jenkins Server and Docker Host:

1. .pem has been stored in Private S3 Bucket and Jenkins server can connect with s3 using aws s3 cp s3://pemkeytw/mediawiki.pem /root and can download the .pem of docker host

2. ssh-keygen from Jenkins Server and id_rsa.pub has been moved to authorized_keys of Docker host to establish connection

3. Now, Jenkins server would be able to connect to DockerHost for Build and Deploy actions

Jenkins Pipleine Creation:

1. In Jenkins go to  New Item → Pipeline, type the name you want for this Pipeline project and then click OK.

2. Following that you can skip all General and Build Trigger options and go straight to the Pipeline section. Here you can include a Pipeline definition named Jenkinsfile from Github.

3. Now we are ready to run the Pipeline and check the output if an error is present on any stage during the run.

Jenkins Pipleine Stages:

1. Cloing our Github

2. Building our image

3. Deploy our image

4. Cleaning up 

5. deploy into Docker Host

Pre-requisites needs to be done:

1. Add docker permisisons for Jenkins user.
2. Open port 8080 in Docker Host machine to expose the application publicly.
3. SSH Public keys needs to shared from Jenkins Host to Docker host for secure SSH Connection.
4. Please note that Jenkins terraform script needs to be execured first and Packer build then after.








