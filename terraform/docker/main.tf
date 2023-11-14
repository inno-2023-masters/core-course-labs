variable "container_name" {
  description = "Name for the Docker container"
  type        = string
  default     = "my-docker-container"
}

output "docker_container_name" {
  value = docker_container.nginx.name
}

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = "rinnatova/docker_lab:latest"

  name = "my-docker_container"
  ports {
    internal = 80
    external = 8000
  }
}

