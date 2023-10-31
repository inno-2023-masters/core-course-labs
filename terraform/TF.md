# Introduction to terraform results

- `terraform state list` output:

```shell
docker_container.nginx
docker_image.nginx
yandex_iam_service_account.registry-sa
yandex_resourcemanager_folder_iam_member.registry-sa-role-images-puller
yandex_serverless_container.test-container
```

- `terraform show` output:

```shell
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
    dns                                         = []
    dns_opts                                    = []
    dns_search                                  = []
    entrypoint                                  = [
        "/docker-entrypoint.sh",
    ]
    env                                         = []
    group_add                                   = []
    hostname                                    = "45d61dbbf714"
    id                                          = "45d61dbbf714e07918b09470f08a8f2a48db584087866aec7e82b266278c0fd9"
    image                                       = "sha256:61395b4c586da2b9b3b7ca903ea6a448e6783dfdd7f768ff2c1a0f3360aaba99"
    init                                        = false
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    log_opts                                    = {}
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
            ip_address                = "172.17.0.2"
            ip_prefix_length          = 16
            ipv6_gateway              = ""
            mac_address               = "02:42:ac:11:00:02"
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
    storage_opts                                = {}
    sysctls                                     = {}
    tmpfs                                       = {}
    tty                                         = false
    wait                                        = false
    wait_timeout                                = 60

    ports {
        external = 8000
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.nginx:
resource "docker_image" "nginx" {
    id           = "sha256:61395b4c586da2b9b3b7ca903ea6a448e6783dfdd7f768ff2c1a0f3360aaba99nginx"
    image_id     = "sha256:61395b4c586da2b9b3b7ca903ea6a448e6783dfdd7f768ff2c1a0f3360aaba99"
    keep_locally = false
    name         = "nginx"
    repo_digest  = "nginx@sha256:32da30332506740a2f7c34d5dc70467b7f14ec67d912703568daff790ab3f755"
}

# yandex_iam_service_account.registry-sa:
resource "yandex_iam_service_account" "registry-sa" {
    created_at = "2023-09-22T23:44:17Z"
    folder_id  = "b1gtsu23dk09cro6u8c4"
    id         = "aje315cvb49dmssd75nc"
    name       = "devops-sa"
}

# yandex_resourcemanager_folder_iam_member.registry-sa-role-images-puller:
resource "yandex_resourcemanager_folder_iam_member" "registry-sa-role-images-puller" {
    folder_id = "b1gtsu23dk09cro6u8c4"
    id        = "b1gtsu23dk09cro6u8c4/container-registry.images.puller/serviceAccount:aje315cvb49dmssd75nc"
    member    = "serviceAccount:aje315cvb49dmssd75nc"
    role      = "container-registry.images.puller"
}

# yandex_serverless_container.test-container:
resource "yandex_serverless_container" "test-container" {
    concurrency        = 0
    core_fraction      = 100
    cores              = 1
    created_at         = "2023-09-22T23:49:28Z"
    execution_timeout  = "10s"
    folder_id          = "b1gtsu23dk09cro6u8c4"
    id                 = "bbalsvsj428tm1icpfdi"
    memory             = 128
    name               = "python-vm"
    revision_id        = "bba35offdv0vm3s12g2b"
    service_account_id = "aje315cvb49dmssd75nc"
    url                = "https://bbalsvsj428tm1icpfdi.containers.yandexcloud.net/"

    connectivity {
        network_id = "enpuagfvk6tb6knjmnkh"
    }

    image {
        digest = "sha256:bac1c68f782ab6565224934f46f976c119d200b9b103b4fb07cf08d66e1e7277"
        url    = "cr.yandex/crpinl9ds4d9ktrdajiq/time-python"
    }
}
```

# GitHub infrastructure

- Added 2 teams, for 

# Best Practices applied

- File naming conventions:
  - `main.tf` - call modules, locals, and data sources to create all resources
  - `variables.tf` - contains declarations of variables used in `main.tf`
  - `terraform.tfvars` - contains values for variables declared in `variables.tf`
- Use of `terraform fmt` to format code
- Use of locals to store values that are used multiple times
- Use of variables to store sensitive data