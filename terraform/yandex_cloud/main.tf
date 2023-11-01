terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.99.1"
    }
  }
}

locals {
  folder_id = "b1g33g1fgrfkjr84jeqj"
  cloud_id = "b1g49u1t26i707kupbpv"
}

provider "yandex" {
  zone = var.zone
  folder_id = "b1g33g1fgrfkjr84jeqj"
  cloud_id = "b1g49u1t26i707kupbpv"
  service_account_key_file = "./authorized_key.json"
}

resource "yandex_compute_instance" "vm" {
  name = var.vm_name

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd82sqrj4uk9j7vlki3q"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }
}

resource "yandex_vpc_network" "network" {}

resource "yandex_vpc_subnet" "subnet" {
  zone           = var.zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["10.128.0.0/24"]
}