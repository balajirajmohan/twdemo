instance_count              = 1
name                        = "docker-host"
ami                         = "ami-0202ebcc3bee25db0"  # Golden AMI created from packer
instance_type               = "t2.micro"
subnet_id                   = "subnet-b1c761fd"
associate_public_ip_address = true
key_name                    = "mediawiki" #key
iam_instance_profile        = "admin" #EC2 Role
user_data                   = "user_data.sh"

root_block_device = [
    {
        volume_type           = "gp2"
        volume_size           = 10
        delete_on_termination = "true"
        encypted              = "false"
    }
]

volume_tags = {
    "Name"      = "ebs_app"
    "encrypted" = "false"
}

tags = {
    "type" = "Docker Host"
    "description" = "Docker Host"
}

sg_name = "docker_host_sg"

sg_tags = {
    "descrition" = "The security group that allows HTTP port to access the application from anywhere"
}

sg_rules = [
    {
        type        = "ingress" 
        description = "Allows SSH access from anywhere"
        from_port   = "22"
        to_port     = "22"
        protocol    = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    },
    {
        type        = "ingress" 
        description = "Allows HTTP access from anywhere"
        from_port   = "80"
        to_port     = "80"
        protocol    = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    },
	{
        type        = "ingress" 
        description = "To Expose the Docker container outside"
        from_port   = "8080"
        to_port     = "8080"
        protocol    = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    },
    {
        type        = "egress"
        description = "Allow all access"
        from_port   = "-1"
        to_port     = "-1"
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
]