variable "image_url" {
  type        = string
  description = "The Docker image URL"
}

variable "network_id" {
  type        = string
  description = "The ID of the network to deploy to"
}

variable "folder_id" {
  type        = string
  description = "The ID of the yandex folder to deploy to"
}