# ===== Provider
variable "zone" {
  description = "DataCenter zone name, imported from YC_ZONE environment variable"
  default     = "ru-central1-b"
  type        = string
}

# ===== VM
variable "my_vm_name" {
  description = "Name of VM instance"
  default     = "terraform-vm"
  type        = string
}

variable "my_vm_boot_disk_image_name" {
  description = "Name of VM instance's boot disk image"
  default     = "ubuntu-20-04-lts-v20230918"
  type        = string
}

variable "my_vm_boot_disk_image_id" {
  description = "ID of VM instance's boot disk image"
  default     = "fd8dfofgv8k45mqv25nq"
  type        = string
}

variable "my_vm_cores_number" {
  description = "Number of VM instance's CPU cores"
  default     = 2
  type        = number
}

variable "my_vm_core_fraction" {
  description = "Usage of VM instance's CPU core in percent"
  default     = "20"
  type        = number
}

variable "my_vm_memory_gb_number" {
  description = "Amount of VM instance's memory in GB"
  default     = 1
  type        = number
}

# ===== Network
variable "my_network_name" {
  description = "Name of network"
  default     = "terraform-network"
  type        = string
}

variable "my_subnetwork_name" {
  description = "Name of subnetwork"
  default     = "terraform-network-ru-central1-b"
  type        = string
}