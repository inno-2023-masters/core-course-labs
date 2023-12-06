variable "vm_name" {
  default = "tf-vm"
  type    = string
}

variable "vm_boot_disk_image_name" {
  default = "ubuntu-20-04-lts-v20230918"
  type    = string
}

variable "vm_boot_disk_image_id" {
  default = "fd8dfofgv8k45mqv25nq"
  type    = string
}

variable "vm_cores_number" {
  default = 2
  type    = number
}

variable "vm_core_fraction" {
  description = "CPU core usage (percent)"
  default     = "20"
  type        = number
}

variable "vm_memory_gb_number" {
  default = 1
  type    = number
}
