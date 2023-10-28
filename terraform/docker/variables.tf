variable "image" {
  type = string
}

variable "container_name" {
  type = string
}


variable "internal_port" {
  type    = number
  default = 5000
}

variable "external_port" {
  type    = number
  default = 5000
}
