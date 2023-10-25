variable "image_flavor" {
  type = string
  default = "Ubuntu-22.04-202208"
}

variable "compute_flavor" {
  type = string
  default = "Basic-1-2-20"
}

variable "key_pair_name" {
  type = string
  default = "keypair-terraform"
}

variable "availability_zone_name" {
  type = string
  default = "MS1"
}

variable "vk_cloud_username" {
  description = "VK Cloud user name"
}

variable "vk_cloud_pass" {
  description = "VK Cloud password"
  sensitive   = true
}

variable "vk_cloud_project_id" {
  description = "VK Cloud project_id"
  sensitive   = true
}