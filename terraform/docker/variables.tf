variable "docker_image_name" {
  description = "Value of the name for the Docker image"
  default     = "iskanred/app_python:1.0.0"
  type        = string
}

variable "docker_container_name" {
  description = "Value of the name for the Docker container"
  default     = "app_python"
  type        = string
}

variable "docker_container_internal_port" {
  description = "Value of port on which application is running inside Docker container"
  default     = 8080
  type        = number
}

variable "docker_container_external_port" {
  description = "Value of port on which local host redirects requests to Docker cotainer"
  default     = 8080
  type        = number
}
