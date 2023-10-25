terraform {
    required_providers {
        vkcs = {
            source = "vk-cs/vkcs"
            version = "~> 0.1.12"
        }
    }
}

provider "vkcs" {
    username = var.vk_cloud_username

    password = var.vk_cloud_pass

    project_id = var.vk_cloud_project_id

    region = "RegionOne"

    auth_url = "https://infra.mail.ru:35357/v3/"
}