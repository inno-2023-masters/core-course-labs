terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

resource "docker_image" "python_app_image" {
  name         = var.image
  keep_locally = false
}

resource "docker_container" "my_python_app" {
  image = docker_image.python_app_image.image_id
  name  = var.container_name
  ports {
    internal = var.internal_port
    external = var.external_port
  }
}
