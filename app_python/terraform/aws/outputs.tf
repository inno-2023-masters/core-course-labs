output "public_ip" {
  description = "ip of service"
  value       = aws_instance.app_python.public_ip
}