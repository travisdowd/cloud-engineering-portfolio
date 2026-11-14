
output "control_server_public_ip" {
  description = "Public IP of Ansible control server"
  value       = aws_instance.control.public_ip
}

output "web_server_public_ips" {
  description = "Public IP addresses of the three web servers"
  value       = aws_instance.web[*].public_ip
}

output "web_server_public_dns" {
  description = "Public DNS names of the web servers"
  value       = aws_instance.web[*].public_dns
}