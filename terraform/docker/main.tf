terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "app_python" {
  name         = "elatypovinno/devops_inno:latest"
  keep_locally = false
}

resource "docker_container" "app_python_container" {
  image = docker_image.app_python.image_id
  name  = var.container_name

  ports {
    internal = 8080
    external = 8080
  }
}
