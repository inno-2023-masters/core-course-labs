output "container_id" {
  description = "docker container id"
  value       = docker_container.app_python.id
}

output "image_id" {
  description = "docker image id"
  value       = docker_image.app_python.id
}