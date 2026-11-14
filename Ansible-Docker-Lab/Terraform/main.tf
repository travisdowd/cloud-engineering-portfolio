
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Get the latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

# Security group for Ansible control server
resource "aws_security_group" "control_sg" {
  name        = "ansible-control-sg"
  description = "Security group for Ansible control server"

  ingress {
    description = "SSH from administrator"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.admin_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security group for web servers
resource "aws_security_group" "web_sg" {
  name        = "ansible-web-sg"
  description = "Security group for NGINX web servers"

  ingress {
    description     = "SSH from Ansible control server"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.control_sg.id]
  }

  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Ansible control server
resource "aws_instance" "control" {
  key_name               = aws_key_pair.ansible_key.key_name
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.control_sg.id]

  tags = {
    Name = "Ansible-Control-Server"
  }
}

# Three web servers
resource "aws_instance" "web" {
  key_name               = aws_key_pair.ansible_key.key_name
  count                  = 3
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "Ansible-Web-${count.index + 1}"
  }
}

# Upload SSH public key to AWS
resource "aws_key_pair" "ansible_key" {
  key_name   = "ansible-docker-lab-key"
  public_key = file(pathexpand("~/.ssh/ansible-lab.pub"))
}