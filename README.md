# Thoughtworks - Mediaiki Application deployment using CI-CD pipeline

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

   Open Powershell as admin and run Set-ExecutionPolicy RemoteSigned -scope CurrentUser followed by iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
   scoop install packer
   
   For Linux/Macos- https://www.packer.io/docs/install


2. Terraform - https://www.terraform.io/downloads.html -> Windows 64Bit and allow the download.
   unzip terraform.exe and add the AWS Access Key ID and secret access key to Windows Environment Variables.
   
   

Please follow the below steps for deploying the mediawiki application.

1. Set the AWS access and secret keys as env variables in the local machine.
2. Run the packer build from local machine to create the golden AMI which will be used for the application server.
```bash
packer build redhat.json
```
3. Create the Jenkins server via terraform code.
4. Configure the Jenkins and install the "Amazon EC2 Plugin". Create a keypair and place the pem key contents in "EC2 Key Pair's Private Key"
5. Use Systems manager document "AWS-RunRemoteScript" and pass the required parameters using the Jenkins job. Use the awc cli command
```bash
aws ssm send-command
```
6. Once the jenkins job is completed successfully hit the url
```bash
http://<your-server-public-ip>
```

|    Actions        |  Tools Used                |
| ----------------- | -------------------------- |
| AMI Creation      |  Packer                    |
| Infra Provisioning|  Terraform                 |
| Deployment        |  Ansible                   |
| Orchestration Tool|  Jenkins & Systems Manager |