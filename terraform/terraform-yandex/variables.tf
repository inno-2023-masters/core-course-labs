variable "zone" {
  default = "ru-central1-b"
  type    = string
}


variable "my_vm_name" {
  default = "terraform-vm"
  type    = string
}

variable "my_vm_boot_disk_image_name" {
  default = "ubuntu-20-04-lts-v20230918"
  type    = string
}

variable "my_vm_boot_disk_image_id" {
  default = "fd8dfofgv8k45mqv25nq"
  type    = string
}

variable "my_vm_cores_number" {
  default = 2
  type    = number
}

variable "my_vm_core_fraction" {
  default = "20"
  type    = number
}

variable "my_vm_memory_gb_number" {
  default = 1
  type    = number
}

variable "my_network_name" {
  default = "terraform-network"
  type    = string
}

variable "my_subnetwork_name" {
  default = "terraform-network-ru-central1-b"
  type    = string
}