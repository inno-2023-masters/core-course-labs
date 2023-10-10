terraform {
    required_providers {
        vkcs = {
            source = "vk-cs/vkcs"
            version = "~> 0.1.12" 
        }
    }
}

provider "vkcs" {
    # Your user account.

    username = var.username
    password = var.password
    project_id = var.project_id
    region = var.region
    auth_url = var.auth_url
}
