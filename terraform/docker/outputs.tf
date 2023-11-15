output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.app_python.id
}

output "image_name" {
  description = "Name of the Docker image"
  value       = docker_image.app_python.name
}