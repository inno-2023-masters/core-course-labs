terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.47.0"
    }
  }
}

# NGINX in Docker

provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"

  ports {
    internal = 80
    external = 8000
  }
}

# Yandex

locals {
  zone       = "ru-central1-a"
  sa_name    = "devops-sa"
  folder_id  = var.folder_id
  vm_name    = "python-vm"
  vm_memory  = 128
  image_url  = var.image_url
  network_id = var.network_id
}

resource "yandex_iam_service_account" "registry-sa" {
  name      = local.sa_name
  folder_id = var.folder_id
}

resource "yandex_resourcemanager_folder_iam_member" "registry-sa-role-images-puller" {
  folder_id = var.folder_id
  role      = "container-registry.images.puller"
  member    = "serviceAccount:${yandex_iam_service_account.registry-sa.id}"
}

provider "yandex" {
  zone = local.zone
}

resource "yandex_serverless_container" "test-container" {
  name               = local.vm_name
  memory             = local.vm_memory
  service_account_id = yandex_iam_service_account.registry-sa.id

  image {
    url = var.image_url
  }

  connectivity {
    network_id = local.network_id
  }
}