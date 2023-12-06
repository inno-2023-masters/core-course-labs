provider "yandex" {
  zone = "ru-central1-b"
}

resource "yandex_compute_instance" "compute_instance" {
  name = var.vm_name

  resources {
    cores         = var.vm_cores_number
    core_fraction = var.vm_core_fraction
    memory        = var.vm_memory_gb_number
  }

  boot_disk {
    initialize_params {
      name     = var.vm_boot_disk_image_name
      image_id = var.vm_boot_disk_image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
  }
}

resource "yandex_vpc_network" "net" {
  name = "terraform-network"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "terraform-network-ru-central1-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.net.id
  v4_cidr_blocks = ["10.129.0.0/24"]
}