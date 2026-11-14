
variable "aws_region" {
  description = "AWS region for infrastructure deployment"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "project_name" {
  description = "Name of the cloud engineering project"
  type        = string
  default     = "Ansible-Docker-Lab"
}

variable "admin_cidr" {
  description = "Your public IP address for SSH access"
  type        = string
}