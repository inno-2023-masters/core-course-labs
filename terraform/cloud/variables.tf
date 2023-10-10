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
  default = "DevOpsLab"
}

variable "availability_zone_name" {
  type = string
  default = "MS1"
}

variable "password" {
  description = "Env variable with password"
  type = string
}

variable "username" {
  description = "Env variable with username"
  type = string
}

variable "project_id" {
  description = "Env variable with project_id"
  type = string
}

variable "region" {
  description = "Env variable with region"
  type = string
}

variable "auth_url" {
  description = "Env variable with auth_url"
  type = string
}
