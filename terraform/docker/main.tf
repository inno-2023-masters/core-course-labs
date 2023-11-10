terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

resource "docker_image" "cute_python_image" {
  name         = var.image
  keep_locally = false
}

resource "docker_container" "python_app" {
  image = docker_image.cute_python_image.image_id
  name  = var.container_name
  ports {
    internal = var.internal_port
    external = var.external_port
  }
}