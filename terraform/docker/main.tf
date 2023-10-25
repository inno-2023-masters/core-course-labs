terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
}

resource "docker_image" "python_app_image" {
  name         = "dmitriypru/core_course_labs_python:latest"
  keep_locally = false
}

resource "docker_container" "python_app_container" {
  image = docker_image.python_app_image.image_id
  name  = var.container_name

  ports {
    internal = 8000
    external = 8000
  }
}
