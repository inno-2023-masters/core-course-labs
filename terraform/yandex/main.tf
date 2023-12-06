provider "yandex" {
  # service_account_key, cloud_id, folder_id are imported from environment variables
  zone = var.zone
}

resource "yandex_compute_instance" "my_vm" {
  name                      = var.my_vm_name
  allow_stopping_for_update = true

  resources {
    cores         = var.my_vm_cores_number
    core_fraction = var.my_vm_core_fraction
    memory        = var.my_vm_memory_gb_number
  }

  boot_disk {
    initialize_params {
      name     = var.my_vm_boot_disk_image_name
      image_id = var.my_vm_boot_disk_image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.my_subnetwork.id
    nat       = true
  }

  scheduling_policy {
    preemptible = true
  }

  metadata = {
    ssh-keys              = "ubuntu:${file("~/.ssh/yandex_vm_ed25519.pub")}"
    user-data             = file("./cloud-config.yml")
    serial-port-enable    = 1
    install-unified-agent = 0
  }
}

resource "yandex_vpc_network" "my_network" {
  name = var.my_network_name
}

resource "yandex_vpc_subnet" "my_subnetwork" {
  name           = var.my_subnetwork_name
  zone           = var.zone
  network_id     = yandex_vpc_network.my_network.id
  v4_cidr_blocks = ["10.129.0.0/24"]
}
