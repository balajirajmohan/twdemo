# Thoughtworks - Mediaiki Application deployment using CI-CD pipeline

Tech Stacks Used:

1.CI/CD- Jenkins
2.Infra Provisioning- Terraform
3.Container Runtime- Docker
4.Image Artifcatory - DockerHub

Steps to Reproduce:
1. Login to AWS Console and Create an IAM user with Admin Role.
2. Download the .csv Crdentials



The repository holds the code for deploying the mediawiki application

Required softwares to be installed in the local machine


2. Terraform - Download from [terraform](https://www.terraform.io/downloads.html)

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