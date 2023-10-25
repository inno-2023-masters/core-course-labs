output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.python_app_container.id
}

output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.python_app_image.id
}