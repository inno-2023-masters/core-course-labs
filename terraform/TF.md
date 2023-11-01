# Terraform

## Terraform best practices 

- Divide the configuration into multiple files.
- Utilize terraform fmt to verify the correct formatting of the files.
- Treat the .tfstate file as sensitive data that should not be publicly shared or distributed among developers. It is more secure to use a "remote" backend to store it on a server, allowing multiple developers to collaborate on the same state.
- Limit the use of the terraform.tfvars file to compositions only.

## terraform-docker

```
terraform apply
```

```
terraform show
```

Output: 

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
    hostname                                    = "e49a05ff930a"
    id                                          = "e49a05ff930afe7bc6dbe4fbf37496b345af77a369cafaf26ae7e31604d5d310"
    image                                       = "sha256:2a4fbb36e96607b16e5af2e24dc6a1025a4795520c98c6b9ead9c4113617cb73"
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
    id           = "sha256:2a4fbb36e96607b16e5af2e24dc6a1025a4795520c98c6b9ead9c4113617cb73nginx"
    image_id     = "sha256:2a4fbb36e96607b16e5af2e24dc6a1025a4795520c98c6b9ead9c4113617cb73"
    keep_locally = false
    name         = "nginx"
    repo_digest  = "nginx@sha256:32da30332506740a2f7c34d5dc70467b7f14ec67d912703568daff790ab3f755"
}
```
---
```
 terraform state list
```
Output: 

```sh
docker_container.nginx
docker_image.nginx
```
---
```
terraform output
```
output:
```sh
container_id = "dc9f9aeadabada45995be345e91c45043643abba54858fffe11091373a347b91"
image_id = "sha256:61395b4c586fa2b9b3b8ca903ea6a448e6783drdd7f768ff2c1a0f3360aaba99nginx:latest"
```

Yandex cloud
```sh
# yandex_compute_instance.my_vm:
resource "yandex_compute_instance" "my_vm" {
    created_at                = "2023-10-03T02:02:42Z"
    folder_id                 = "b1gcsukd39lji9up1ohe"
    fqdn                      = "epdi2ggisto571h7jm1o.auto.internal"
    id                        = "epdi2ggisto571h7jm1o"
    name                      = "terraform-vm"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-b"

    boot_disk {
        auto_delete = true
        device_name = "epdf45mf4qtse1re776m"
        disk_id     = "epdf45mf4qtse1re776m"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8dfofgv8k45mqv25nq"
            name       = "ubuntu-20-04-lts-v20230918"
            size       = 5
            type       = "network-hdd"
        }
    }

    metadata_options {
        aws_v1_http_endpoint = 1
        aws_v1_http_token    = 2
        gce_http_endpoint    = 1
        gce_http_token       = 1
    }

    network_interface {
        index              = 0
        ip_address         = "10.129.0.26"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:12:14:21:2e"
        nat                = false
        security_group_ids = []
        subnet_id          = "e2la6hksalj13g2vu6ma"
    }

    placement_policy {
        host_affinity_rules = []
    }

    resources {
        core_fraction = 20
        cores         = 2
        gpus          = 0
        memory        = 1
    }

    scheduling_policy {
        preemptible = false
    }
}

# yandex_vpc_network.my_network:
resource "yandex_vpc_network" "my_network" {
    created_at                = "2023-10-03T02:02:42Z"
    default_security_group_id = "enpus0o4b692jt8qft19"
    folder_id                 = "b1gcsukd39lji9up1ohe"
    id                        = "enpjvfav2l2pom29080g"
    labels                    = {}
    name                      = "terraform-network"
    subnet_ids                = [
        "e2la6hksalj13g2vu6ma",
    ]
}

# yandex_vpc_subnet.my_subnetwork:
resource "yandex_vpc_subnet" "my_subnetwork" {
    created_at     = "2023-10-03T02:02:42Z"
    folder_id      = "b1gcsukd39lji9up1ohe"
    id             = "e2la6hksalj13g2vu6ma"
    labels         = {}
    name           = "terraform-network-ru-central1-b"
    network_id     = "enpjvfav2l2pom29080g"
    v4_cidr_blocks = [
        "10.129.0.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-b"
}


Outputs:

instance_created_at = "2023-10-03T02:02:42Z"
instance_id = "epdi2ggisto571h7jm1o"
```