variable "docker_image_name" {
  default     = "art22m/pyapp:v1"
  type        = string
}

variable "docker_container_name" {
  default     = "art22m_pyapp"
  type        = string
}

variable "docker_container_internal_port" {
  default     = 8000
  type        = number
}

variable "docker_container_external_port" {
  default     = 8000
  type        = number
}