# Ansible, Terraform & Docker Cloud Engineering Lab

## Project Overview

This project demonstrates practical cloud engineering and automation skills using AWS, Terraform, Ansible, Python, and Docker.

The lab provisions AWS infrastructure using Infrastructure as Code, automates web server configuration with Ansible, and deploys a containerized Python web application using Docker.

## Technologies Used

- **AWS EC2:** Cloud-hosted Linux infrastructure
- **Terraform:** Infrastructure as Code
- **Ansible:** Configuration management and automation
- **Docker:** Application containerization
- **Python:** Application development
- **Flask:** Lightweight Python web framework
- **Gunicorn:** Python WSGI application server
- **Amazon Linux 2023:** Linux server operating system

## Part 1: Infrastructure Provisioning & Configuration Management

Terraform provisions:

- One Ansible control server
- Three Amazon Linux web servers
- AWS security groups and SSH access controls
- AWS key pair configuration

Ansible automates the configuration of all three web servers.

The playbook installs NGINX, starts the service, and enables it at boot.

**Validation:**
- Successfully connected to all three web servers using Ansible.
- Executed the Ansible playbook successfully.
- Verified NGINX was active on all three servers.
- Confirmed the NGINX welcome page was accessible over HTTP