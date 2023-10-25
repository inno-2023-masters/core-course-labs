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
  name         = "justsomedude22/app_python:latest"
  keep_locally = false
  force_remove = true
}

resource "docker_container" "app_python" {
  image = docker_image.app_python.image_id
  name  = var.container_name
  ports {
    internal = 5000
    external = 5000
  }
}