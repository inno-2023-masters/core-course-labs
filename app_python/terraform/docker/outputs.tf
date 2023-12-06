output "container_id" {
  description = "container id"
  value       = docker_container.app_python.id
}

output "image_id" {
  description = "image id"
  value       = docker_image.app_python.id
}

