output "image_id" {
  description = "App Image ID"
  value       = docker_image.nginx.image_id
}

output "container_id" {
  description = "App Container ID"
  value       = docker_container.nginx.id
}