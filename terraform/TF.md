# Results of terrorm demo

## Terraform tutorial

`terraform state list`

```sh
    docker_container.nginx
    docker_image.nginx
```

`terraform state show docker_container.nginx`

```sh
# docker_container.nginx:
resource "docker_container" "nginx" {
    attach                                      = false
    command                                     = [
        "nginx",
        "-g",
        "daemon off;",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = [
        "/docker-entrypoint.sh",
    ]
    env                                         = []
    hostname                                    = "4dffca91906c"
    id                                          = "4dffca91906c9e8485a96d654526435bfefe531061965aa1c4050dab1ddbedde"
    image                                       = "sha256:61395b4c586da2b9b3b7ca903ea6a448e6783dfdd7f768ff2c1a0f3360aaba99"
    init                                        = false
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "tutorial"
    network_data                                = [
        {
            gateway                   = "172.17.0.1"
            global_ipv6_address       = ""
            global_ipv6_prefix_length = 0
            ip_address                = "172.17.0.3"
            ip_prefix_length          = 16
            ipv6_gateway              = ""
            mac_address               = "02:42:ac:11:00:03"
            network_name              = "bridge"
        },
    ]
    network_mode                                = "default"
    privileged                                  = false
    publish_all_ports                           = false
    read_only                                   = false
    remove_volumes                              = true
    restart                                     = "no"
    rm                                          = false
    runtime                                     = "runc"
    security_opts                               = []
    shm_size                                    = 64
    start                                       = true
    stdin_open                                  = false
    stop_signal                                 = "SIGQUIT"
    stop_timeout                                = 0
    tty                                         = false
    wait                                        = false
    wait_timeout                                = 60

    ports {
        external = 8080
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}
```

`terraform state show docker_image.nginx`

```sh
    # docker_image.nginx:
resource "docker_image" "nginx" {
    id           = "sha256:61395b4c586da2b9b3b7ca903ea6a448e6783dfdd7f768ff2c1a0f3360aaba99nginx"
    image_id     = "sha256:61395b4c586da2b9b3b7ca903ea6a448e6783dfdd7f768ff2c1a0f3360aaba99"
    keep_locally = false
    name         = "nginx"
    repo_digest  = "nginx@sha256:32da30332506740a2f7c34d5dc70467b7f14ec67d912703568daff790ab3f755"
}
```

### Document changes

I followed a tutorial and changes a port from 8000 to 8080

```sh
~ ports {
    ~ external = 8000 -> 8080 # forces replacement
    # (3 unchanged attributes hidden)
}
```

### Output

`terraform output`

Result:

```sh
container_id = "c367fc2ea39c406b563a2921bc0baf69105bed3df62e584530ddce362e441bf6"
image_id = "sha256:61395b4c586da2b9b3b7ca903ea6a448e6783dfdd7f768ff2c1a0f3360aaba99nginx"
```

## Yandex-cloud terraform

### Create a service account

Create an Yandex Cloud account, create a service account and download the key file. Then follow a provider documentation from Terraform to configure the Yandex provider.

### Results

`terraform state list`

```sh
    yandex_iam_service_account.sa
    yandex_iam_service_account_static_access_key.sa-static-key
    yandex_resourcemanager_folder_iam_member.sa-editor
    yandex_storage_bucket.inno-devops-bucket
```

Output of terraform apply:

``` sh
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:

+ create

Terraform will perform the following actions:

# yandex_iam_service_account.sa will be created

+ resource "yandex_iam_service_account" "sa" {
+ created_at = (known after apply)
+ folder_id  = "secret_value"
+ id         = (known after apply)
+ name       = "tf-test-sa"
    }

# yandex_iam_service_account_static_access_key.sa-static-key will be created

+ resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
+ access_key           = (known after apply)
+ created_at           = (known after apply)
+ description          = "static access key for object storage"
+ encrypted_secret_key = (known after apply)
+ id                   = (known after apply)
+ key_fingerprint      = (known after apply)
+ secret_key           = (sensitive value)
+ service_account_id   = (known after apply)
    }

# yandex_resourcemanager_folder_iam_member.sa-editor will be created

+ resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
+ folder_id = "secret_value"
+ id        = (known after apply)
+ member    = (known after apply)
+ role      = "storage.admin"
    }

# yandex_storage_bucket.inno-devops-bucket will be created

+ resource "yandex_storage_bucket" "inno-devops-bucket" {
+ access_key            = (known after apply)
+ acl                   = "public-read"
+ bucket                = "tf-infro-site-bucket"
+ bucket_domain_name    = (known after apply)
+ default_storage_class = (known after apply)
+ folder_id             = (known after apply)
+ force_destroy         = false
+ id                    = (known after apply)
+ secret_key            = (sensitive value)
+ website_domain        = (known after apply)
+ website_endpoint      = (known after apply)

+ website {
    + index_document = "index.html"
        }
    }
```

## Docker Terraform

Following the [Manage and maintain Github with Terraform](https://dev.to/pwd9000/manage-and-maintain-github-with-terraform-2k86) tutorial, new [repository](https://github.com/Max3kkk/devops-f23-terraform) was created and added to the terraform configuration. In the original configuration from tutorial I changed the name of the repository, added a description, changed default branch to `main`. Terraform import was run to import the existing repository to the configuration. Then `terraform apply` was run to apply the changes to the repository.

## Best practices

- Use environment variables for sensitive data

- Use `terraform fmt` to format the code

- Use `terraform validate` to validate the code

- Use `terraform plan` to see the changes before applying them

- Add unwanted files to `.gitignore`

- Use `terraform import` to import existing infrastructure to the configuration

- Break configuration into modules
