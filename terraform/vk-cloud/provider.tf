terraform {
  required_providers {
    vkcs = {
      source  = "vk-cs/vkcs"
      version = "~> 0.1.12"
    }
  }
}

provider "vkcs" {
  username = "e.semenova@innopolis.university"
  password = var.password

  # The tenant token can be taken from the project Settings tab - > API keys.
  # Project ID will be our token.
  project_id = "7ae5b8f9aac9477db5d75fd026ad449c"

  region   = "RegionOne"
  auth_url = "https://infra.mail.ru:35357/v3/"
}