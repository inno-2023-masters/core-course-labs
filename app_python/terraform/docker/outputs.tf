output "container" {
  description = "ID of the Docker container"
  value       = docker_container.app_python.id
}

output "image" {
  description = "ID of the Docker image"
  value       = docker_image.app_python.id
}