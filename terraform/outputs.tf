output "cpp_container_id" {
  description = "cpp container ID"
  value       = docker_container.myapp_cpp.id
}

output "python_container_id" {
  description = "python container ID"
  value       = docker_container.myapp_python.id
}