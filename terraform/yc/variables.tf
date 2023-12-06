variable "cloud_cores" {
  description = "Number of cores on the infrastructure"
  type        = number
  default     = 2
}

variable "cloud_memory" {
  description = "Amount of memory on the infrastructure"
  type        = number
  default     = 2
}

variable "ubuntu_image_id" {
  description = "The ID of the image to use for the instance"
  type        = string
  default     = "fd8djv1vmpfdkn5eporh"
}