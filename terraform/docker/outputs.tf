output "container_id" {
  description = "Container ID"
  value       = docker_container.my_python_app.id
}

output "image_id" {
  description = "Container image"
  value       = docker_image.python_app_image.id
}
