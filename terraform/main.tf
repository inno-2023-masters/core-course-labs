terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}
#####################
resource "docker_image" "test_image_cpp" {
  name         = "muurrk/myapp_cpp:latest"
  keep_locally = false
}

resource "docker_container" "myapp_cpp" {
  image = docker_image.test_image_cpp.image_id
  name = "Myapp_cpp_NEW"
  ports {
    internal = 8080
    external = 5555
  }
}
############################
resource "docker_image" "test_image_python" {
  name         = "muurrk/myapp:latest"
  keep_locally = false
}

resource "docker_container" "myapp_python" {
  image = docker_image.test_image_python.image_id
  name = "Myapp_python_NEW"
  ports {
    internal = 8888
    external = 4444
  }
}
########################

module "cloud" {
  source = "./cloud"
}

module "github" {
  source = "./github"
}

module "github_teams" {
  source = "./github_teams"
}