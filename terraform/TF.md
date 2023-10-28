
<!-- TOC -->

- [Markdown Navigation](#markdown-navigation)
    - [Applied Best Practices](#applied-best-practices)
    - [Docker](#docker)
    - [AWS](#aws)
    - [Github](#github)
    - [GithubTeams](#githubteams)
<!-- /TOC -->

# Applied Best Practices
- Dividing main.tf into main.tf, variables.tf, outputs.tf for efficiency
- Use terraform validate
- Use terraform fmt
- Include description on all variables even if you think it is obvious
- Keep secrets in environment variables instead of putting them in code


# Docker

## terraform state list

```
module.app_python.docker_container.python_app
module.app_python.docker_image.python_app_image
module.app_typescript.docker_container.python_app
module.app_typescript.docker_image.python_app_image
```

## terraform show

```
# module.app_python.docker_container.python_app:
resource "docker_container" "python_app" {
    attach                                      = false
    command                                     = [
        "python",
        "manage.py",
        "runserver",
        "0.0.0.0:8000",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    dns                                         = []
    dns_opts                                    = []
    dns_search                                  = []
    entrypoint                                  = []
    env                                         = []
    group_add                                   = []
    hostname                                    = "7e8f5445668a"
    id                                          = "7e8f5445668adde40aa9e23f66256da4350f1e5c9ac9b59547e38812a3290e27"
    image                                       = "sha256:1ee188ee093eccd79c290c7a0124ddc9cb5f3fad996d98dbbd373c3d6e6f6031"
    init                                        = false
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    log_opts                                    = {}
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "python_app"
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
    stop_timeout                                = 0
    storage_opts                                = {}
    sysctls                                     = {}
    tmpfs                                       = {}
    tty                                         = false
    user                                        = "cooluser"
    wait                                        = false
    wait_timeout                                = 60
    working_dir                                 = "/app"

    ports {
        external = 5000
        internal = 5000
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# module.app_python.docker_image.python_app_image:
resource "docker_image" "python_app_image" {
    id           = "sha256:1ee188ee093eccd79c290c7a0124ddc9cb5f3fad996d98dbbd373c3d6e6f6031rametago/my-first-repo:latest"
    image_id     = "sha256:1ee188ee093eccd79c290c7a0124ddc9cb5f3fad996d98dbbd373c3d6e6f6031"
    keep_locally = false
    name         = "rametago/my-first-repo:latest"
    repo_digest  = "rametago/my-first-repo@sha256:7aa92828447bdc7b82fb9ded07f674769d0bac4fb8be1b55186f34e74f2d6120"
}
# module.app_typescript.docker_container.python_app:
resource "docker_container" "python_app" {
    attach                                      = false
    command                                     = []
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    dns                                         = []
    dns_opts                                    = []
    dns_search                                  = []
    entrypoint                                  = [
        "npm",
        "run",
        "dev",
    ]
    env                                         = []
    group_add                                   = []
    hostname                                    = "37d6821be5ae"
    id                                          = "37d6821be5ae484ff173d54720214061b6c1d88d00a62288644f4f155963f61b"
    image                                       = "sha256:2e6f493e826171d69a1942acf3b498eea6c7b8657ef178e7d33a6b52a14a97b0"
    init                                        = false
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    log_opts                                    = {}
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "typescript_app"
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
    }
}

# module.app_typescript.docker_image.python_app_image:
resource "docker_image" "python_app_image" {
    id           = "sha256:2e6f493e826171d69a1942acf3b498eea6c7b8657ef178e7d33a6b52a14a97b0rametago/my-first-repo:svelte"
    image_id     = "sha256:2e6f493e826171d69a1942acf3b498eea6c7b8657ef178e7d33a6b52a14a97b0"
    keep_locally = false
    name         = "rametago/my-first-repo:svelte"
    repo_digest  = "rametago/my-first-repo@sha256:67f9ac5d63f678b79cb9c995d450cbded94c8ad3d863c8bf1c25bc62635bd3f8"
}


Outputs:

python_container_id = "7e8f5445668adde40aa9e23f66256da4350f1e5c9ac9b59547e38812a3290e27"
typescript_container_id = "37d6821be5ae484ff173d54720214061b6c1d88d00a62288644f4f155963f61b"
```

## terraform plan
After changing container name

```
module.app_python.docker_image.python_app_image: Refreshing state... [id=sha256:1ee188ee093eccd79c290c7a0124ddc9cb5f3fad996d98dbbd373c3d6e6f6031rametago/my-first-repo:latest]
module.app_typescript.docker_image.python_app_image: Refreshing state... [id=sha256:2e6f493e826171d69a1942acf3b498eea6c7b8657ef178e7d33a6b52a14a97b0rametago/my-first-repo:svelte]
module.app_typescript.docker_container.python_app: Refreshing state... [id=37d6821be5ae484ff173d54720214061b6c1d88d00a62288644f4f155963f61b]
module.app_python.docker_container.python_app: Refreshing state... [id=7e8f5445668adde40aa9e23f66256da4350f1e5c9ac9b59547e38812a3290e27]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
  - destroy

Terraform will perform the following actions:

  # module.app_python.docker_container.my_python_app will be created
  + resource "docker_container" "my_python_app" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = "sha256:1ee188ee093eccd79c290c7a0124ddc9cb5f3fad996d98dbbd373c3d6e6f6031"
      + init                                        = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "my_python_app"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + ports {
          + external = 5000
          + internal = 5000
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # module.app_python.docker_container.python_app will be destroyed
  # (because docker_container.python_app is not in configuration)
  - resource "docker_container" "python_app" {
      - attach                                      = false -> null
      - command                                     = [
          - "python",
          - "manage.py",
          - "runserver",
          - "0.0.0.0:8000",
        ] -> null
      - container_read_refresh_timeout_milliseconds = 15000 -> null
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      - entrypoint                                  = [] -> null
      - env                                         = [] -> null
      - group_add                                   = [] -> null
      - hostname                                    = "7e8f5445668a" -> null
      - id                                          = "7e8f5445668adde40aa9e23f66256da4350f1e5c9ac9b59547e38812a3290e27" -> null
      - image                                       = "sha256:1ee188ee093eccd79c290c7a0124ddc9cb5f3fad996d98dbbd373c3d6e6f6031" -> null
      - init                                        = false -> null
      - ipc_mode                                    = "private" -> null
      - log_driver                                  = "json-file" -> null
      - log_opts                                    = {} -> null
      - logs                                        = false -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
      - must_run                                    = true -> null
      - name                                        = "python_app" -> null
      - network_data                                = [
          - {
              - gateway                   = "172.17.0.1"
              - global_ipv6_address       = ""
              - global_ipv6_prefix_length = 0
              - ip_address                = "172.17.0.2"
              - ip_prefix_length          = 16
              - ipv6_gateway              = ""
              - mac_address               = "02:42:ac:11:00:02"
              - network_name              = "bridge"
            },
        ] -> null
      - network_mode                                = "default" -> null
      - privileged                                  = false -> null
      - publish_all_ports                           = false -> null
      - read_only                                   = false -> null
      - remove_volumes                              = true -> null
      - restart                                     = "no" -> null
      - rm                                          = false -> null
      - runtime                                     = "runc" -> null
      - security_opts                               = [] -> null
      - shm_size                                    = 64 -> null
      - start                                       = true -> null
      - stdin_open                                  = false -> null
      - stop_timeout                                = 0 -> null
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
      - tty                                         = false -> null
      - user                                        = "cooluser" -> null
      - wait                                        = false -> null
      - wait_timeout                                = 60 -> null
      - working_dir                                 = "/app" -> null

      - ports {
          - external = 5000 -> null
          - internal = 5000 -> null
          - ip       = "0.0.0.0" -> null
          - protocol = "tcp" -> null
        }
    }

  # module.app_typescript.docker_container.my_python_app will be created
  + resource "docker_container" "my_python_app" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = "sha256:2e6f493e826171d69a1942acf3b498eea6c7b8657ef178e7d33a6b52a14a97b0"
      + init                                        = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "my_typescript_app"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + ports {
          + external = 5137
          + internal = 5137
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # module.app_typescript.docker_container.python_app will be destroyed
  # (because docker_container.python_app is not in configuration)
  - resource "docker_container" "python_app" {
      - attach                                      = false -> null
      - command                                     = [] -> null
      - container_read_refresh_timeout_milliseconds = 15000 -> null
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      - entrypoint                                  = [
          - "npm",
          - "run",
          - "dev",
        ] -> null
      - env                                         = [] -> null
      - group_add                                   = [] -> null
      - hostname                                    = "37d6821be5ae" -> null
      - id                                          = "37d6821be5ae484ff173d54720214061b6c1d88d00a62288644f4f155963f61b" -> null
      - image                                       = "sha256:2e6f493e826171d69a1942acf3b498eea6c7b8657ef178e7d33a6b52a14a97b0" -> null
      - init                                        = false -> null
      - ipc_mode                                    = "private" -> null
      - log_driver                                  = "json-file" -> null
      - log_opts                                    = {} -> null
      - logs                                        = false -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
      - must_run                                    = true -> null
      - name                                        = "typescript_app" -> null
      - network_data                                = [
          - {
              - gateway                   = "172.17.0.1"
              - global_ipv6_address       = ""
              - global_ipv6_prefix_length = 0
              - ip_address                = "172.17.0.3"
              - ip_prefix_length          = 16
              - ipv6_gateway              = ""
              - mac_address               = "02:42:ac:11:00:03"
              - network_name              = "bridge"
            },
        ] -> null
      - stop_timeout                                = 0 -> null
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
      - tty                                         = false -> null
      - user                                        = "myuser" -> null
      - wait                                        = false -> null
      - wait_timeout                                = 60 -> null
      - working_dir                                 = "/app" -> null

      - ports {
          - external = 5137 -> null
          - internal = 5137 -> null
          - ip       = "0.0.0.0" -> null
          - protocol = "tcp" -> null
        }
    }

Plan: 2 to add, 0 to change, 2 to destroy.

Changes to Outputs:
  ~ python_container_id     = "7e8f5445668adde40aa9e23f66256da4350f1e5c9ac9b59547e38812a3290e27" -> (known after apply)
  ~ typescript_container_id = "37d6821be5ae484ff173d54720214061b6c1d88d00a62288644f4f155963f61b" -> (known after apply)

```

## terraform apply

```
module.app_typescript.docker_image.python_app_image: Refreshing state... [id=sha256:2e6f493e826171d69a1942acf3b498eea6c7b8657ef178e7d33a6b52a14a97b0rametago/my-first-repo:svelte]
module.app_python.docker_image.python_app_image: Refreshing state... [id=sha256:1ee188ee093eccd79c290c7a0124ddc9cb5f3fad996d98dbbd373c3d6e6f6031rametago/my-first-repo:latest]
module.app_typescript.docker_container.my_python_app: Refreshing state... [id=bd2d57065b8ee5e13f93c966478719de584d9b92584fba7a8a9d16d6f16c0860]
module.app_python.docker_container.my_python_app: Refreshing state... [id=00da0fd199ce4e5d0151ef8ff41a2fec33684414e653ebac42f161ae0c6afd89]

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last "terraform apply" which may have affected this plan:

  # module.app_typescript.docker_container.my_python_app has been deleted
  - resource "docker_container" "my_python_app" {
      - id                                          = "bd2d57065b8ee5e13f93c966478719de584d9b92584fba7a8a9d16d6f16c0860" -> null
        name                                        = "my_typescript_app"
        # (16 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }


Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using ignore_changes, the following plan may include actions to undo or
respond to these changes.

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.app_typescript.docker_container.my_python_app will be created
  + resource "docker_container" "my_python_app" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = "sha256:2e6f493e826171d69a1942acf3b498eea6c7b8657ef178e7d33a6b52a14a97b0"
      + init                                        = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "my_typescript_app"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.app_typescript.docker_container.my_python_app: Creating...
module.app_typescript.docker_container.my_python_app: Creation complete after 2s [id=895943a470d3614559693837baca96fd3d4333c1ebb2a06e0d20335fd40efe0f]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

python_container_id = "00da0fd199ce4e5d0151ef8ff41a2fec33684414e653ebac42f161ae0c6afd89"
typescript_container_id = "895943a470d3614559693837baca96fd3d4333c1ebb2a06e0d20335fd40efe0f"
```

## terraform output

```
python_container_id = "0fa450e2677645f00c1ef4532c1b02d3d1addeb56910f1131b06b4ef21377632"
typescript_container_id = "272f97e1e1ad3192d379be407238961d01b185fb8bb280f17df1e60ddd3a2874"
```


# AWS

## terraform plan

```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.app_server will be created
  + resource "aws_instance" "app_server" {
      + ami                                  = "ami-830c94e3"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```

## terraform show
```
# aws_instance.app_server:
resource "aws_instance" "app_server" {
    ami                                  = "ami-830c94e3"
    arn                                  = "arn:aws:ec2:us-west-2:150479635815:instance/i-08a2c715f5eafee4d"
    associate_public_ip_address          = true
    availability_zone                    = "us-west-2b"
    cpu_core_count                       = 1
    cpu_threads_per_core                 = 1
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    id                                   = "i-08a2c715f5eafee4d"
    instance_initiated_shutdown_behavior = "stop"
    instance_state                       = "running"
    instance_type                        = "t2.micro"
    ipv6_address_count                   = 0
    ipv6_addresses                       = []
    monitoring                           = false
    placement_partition_number           = 0
    primary_network_interface_id         = "eni-01cd7a832f31db149"
    private_dns                          = "ip-172-31-28-36.us-west-2.compute.internal"
    private_ip                           = "172.31.28.36"
    public_dns                           = "ec2-18-237-90-230.us-west-2.compute.amazonaws.com"
    public_ip                            = "18.237.90.230"
    secondary_private_ips                = []
    security_groups                      = [
        "default",
    ]
    source_dest_check                    = true
    subnet_id                            = "subnet-0fffe2b4595171c0b"
    tags                                 = {
        "Name" = "ExampleAppServerInstance"
    }
    tags_all                             = {
        "Name" = "ExampleAppServerInstance"
    }
    tenancy                              = "default"
    user_data_replace_on_change          = false
    vpc_security_group_ids               = [
        "sg-073bb22849dea28f7",
    ]

    capacity_reservation_specification {
        capacity_reservation_preference = "open"
    }

    cpu_options {
        core_count       = 1
        threads_per_core = 1
        http_put_response_hop_limit = 1
        http_tokens                 = "optional"
        instance_metadata_tags      = "disabled"
    }

    private_dns_name_options {
        enable_resource_name_dns_a_record    = false
        enable_resource_name_dns_aaaa_record = false
        hostname_type                        = "ip-name"
    }

    root_block_device {
        delete_on_termination = true
        device_name           = "/dev/sda1"
        encrypted             = false
        iops                  = 0
        tags                  = {}
        throughput            = 0
        volume_id             = "vol-0a6a4321b94cbf104"
        volume_size           = 8
        volume_type           = "standard"
    }
}
```
## terraform state list
```
aws_instance.app_server
```

## terraform plan

```
aws_instance.app_server: Refreshing state... [id=i-0d5db481d0819006a]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_instance.app_server must be replaced
-/+ resource "aws_instance" "app_server" {
      ~ ami                                  = "ami-08d70e59c07c61a3a" -> "ami-830c94e3" # forces replacement
      ~ arn                                  = "arn:aws:ec2:us-west-2:150479635815:instance/i-0d5db481d0819006a" -> (known after apply)
      ~ associate_public_ip_address          = true -> (known after apply)
      ~ availability_zone                    = "us-west-2b" -> (known after apply)
      ~ cpu_core_count                       = 1 -> (known after apply)
      ~ cpu_threads_per_core                 = 1 -> (known after apply)
      ~ disable_api_stop                     = false -> (known after apply)
      ~ disable_api_termination              = false -> (known after apply)
      ~ ebs_optimized                        = false -> (known after apply)
      - hibernation                          = false -> null
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      ~ id                                   = "i-0d5db481d0819006a" -> (known after apply)
      ~ instance_initiated_shutdown_behavior = "stop" -> (known after apply)
      ~ instance_state                       = "running" -> (known after apply)
      ~ ipv6_address_count                   = 0 -> (known after apply)
      ~ ipv6_addresses                       = [] -> (known after apply)
      + key_name                             = (known after apply)
      ~ monitoring                           = false -> (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      ~ placement_partition_number           = 0 -> (known after apply)
      ~ primary_network_interface_id         = "eni-0dc0a2440a1a50e62" -> (known after apply)
      ~ private_dns                          = "ip-172-31-27-167.us-west-2.compute.internal" -> (known after apply)
      ~ private_ip                           = "172.31.27.167" -> (known after apply)
      ~ public_dns                           = "ec2-54-202-119-68.us-west-2.compute.amazonaws.com" -> (known after apply)
      ~ public_ip                            = "54.202.119.68" -> (known after apply)
      ~ secondary_private_ips                = [] -> (known after apply)
      ~ security_groups                      = [
          - "default",
        ] -> (known after apply)
      ~ subnet_id                            = "subnet-0fffe2b4595171c0b" -> (known after apply)
        tags                                 = {
            "Name" = "ExampleAppServerInstance"
        }
      ~ tenancy                              = "default" -> (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      ~ vpc_security_group_ids               = [
          - "sg-073bb22849dea28f7",
        ] -> (known after apply)
        # (5 unchanged attributes hidden)

      - capacity_reservation_specification {
          - capacity_reservation_preference = "open" -> null
        }

      - cpu_options {
          - core_count       = 1 -> null
          - threads_per_core = 1 -> null
        }

      - credit_specification {
          - cpu_credits = "standard" -> null
        }

      - enclave_options {
          - enabled = false -> null
        }

      - maintenance_options {
          - auto_recovery = "default" -> null
        }

      - metadata_options {
          - http_endpoint               = "enabled" -> null
          - http_put_response_hop_limit = 1 -> null
          - http_tokens                 = "optional" -> null
          - instance_metadata_tags      = "disabled" -> null
        }

      - private_dns_name_options {
          - enable_resource_name_dns_a_record    = false -> null
          - enable_resource_name_dns_aaaa_record = false -> null
          - hostname_type                        = "ip-name" -> null
        }

      - root_block_device {
          - delete_on_termination = true -> null
          - device_name           = "/dev/sda1" -> null
          - encrypted             = false -> null
          - iops                  = 100 -> null
          - tags                  = {} -> null
          - throughput            = 0 -> null
          - volume_id             = "vol-08fa99877bc2cfb28" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp2" -> null
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.
```

## Outputs

```
Outputs:

instance_id = "i-0b404948e8227d7e6"
instance_public_ip = "35.86.141.140"
```

# Github

## Terraform show


```

# module.github.github_branch_default.core_main:
resource "github_branch_default" "core_main" {
    branch     = "main"
    id         = "test_devops"
    rename     = false
    repository = "test_devops"
}

# module.github.github_branch_default.main:
resource "github_branch_default" "main" {
    branch     = "main"
    id         = "test_repo"
    rename     = false
    repository = "test_repo"
}

# module.github.github_branch_protection.default:
resource "github_branch_protection" "default" {
    allows_deletions                = false
    allows_force_pushes             = false
    blocks_creations                = false
    enforce_admins                  = true
    id                              = "BPR_kwDOKYOSOM4CgLu8"
    lock_branch                     = false
    pattern                         = "main"
    repository_id                   = "test_repo"
    require_conversation_resolution = true
    require_signed_commits          = false
    required_linear_history         = false
}

# module.github.github_repository.core:
resource "github_repository" "core" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = true
    allow_squash_merge          = true
    allow_update_branch         = false
    archived                    = false
    auto_init                   = true
    default_branch              = "main"
    delete_branch_on_merge      = false
    description                 = "Innopolis DevOps 2023 core repository"
    etag                        = "W/\"e29b1fb9cec5a137d658a521dcd0401d1b128d67d0d0c18ca9d289f5f0eb2ac6\""
    full_name                   = "ShohKhan-dev/test_devops"
    git_clone_url               = "git://github.com/ShohKhan-dev/test_devops.git"
    has_discussions             = false
    has_downloads               = false
    has_issues                  = false
    has_projects                = false
    has_wiki                    = false
    html_url                    = "https://github.com/ShohKhan-dev/test_devops"
    http_clone_url              = "https://github.com/ShohKhan-dev/test_devops.git"
    id                          = "test_devops"
    is_template                 = false
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "test_devops"
    node_id                     = "R_kgDOKYOSSA"
    private                     = false
    repo_id                     = 696488520
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:ShohKhan-dev/test_devops.git"
    svn_url                     = "https://github.com/ShohKhan-dev/test_devops"
    topics                      = []
    visibility                  = "public"
    vulnerability_alerts        = false

    security_and_analysis {
        secret_scanning {
            status = "disabled"
        }
        secret_scanning_push_protection {
            status = "disabled"
        }
    }
}

# module.github.github_repository.repo:
resource "github_repository" "repo" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = false
    allow_squash_merge          = false
    allow_update_branch         = false
    archived                    = false
    auto_init                   = true
    default_branch              = "main"
    delete_branch_on_merge      = false
    description                 = "test_repo"
    etag                        = "W/\"38f35bc1721d76df7c84a0d3cc6f9ac1c2503a6f4ac1b105cf1a3bb15ba72b5f\""
    full_name                   = "ShohKhan-dev/test_repo"
    git_clone_url               = "git://github.com/ShohKhan-dev/test_repo.git"
    has_discussions             = false
    has_downloads               = false
    has_issues                  = true
    has_projects                = false
    has_wiki                    = true
    html_url                    = "https://github.com/ShohKhan-dev/test_repo"
    http_clone_url              = "https://github.com/ShohKhan-dev/test_repo.git"
    id                          = "test_repo"
    is_template                 = false
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "test_repo"
    node_id                     = "R_kgDOKYOSOA"
    private                     = false
    repo_id                     = 696488504
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:ShohKhan-dev/test_repo.git"
    svn_url                     = "https://github.com/ShohKhan-dev/test_repo"
    topics                      = []
    visibility                  = "public"
    vulnerability_alerts        = false

    security_and_analysis {
        secret_scanning {
            status = "disabled"
        }
        secret_scanning_push_protection {
            status = "disabled"
        }
    }
}


Outputs:

github_repo_full_name = "ShohKhan-dev/test_repo"
```

## Terraform output

```
github_repo_full_name = "ShohKhan-dev/test_repo"
```

## Terraform state list

```
module.github.github_branch_default.core_main
module.github.github_branch_default.main
module.github.github_branch_protection.default
module.github.github_repository.core
module.github.github_repository.repo
```


# GithubTeams

## terrform apply
```
github_repository.test_devops: Refreshing state... [id=test_devops]
github_branch_default.main: Refreshing state... [id=test_devops]
github_branch_protection.default: Refreshing state... [id=BPR_kwDOKYe_vs4CgRRd]

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last "terraform apply" which may have affected this plan:

  # github_repository.test_devops has changed
  ~ resource "github_repository" "test_devops" {
      ~ full_name                   = "ShohKhan-dev/test_devops" -> "devops-organizational/test_devops"
        id                          = "test_devops"
        name                        = "test_devops"
        # (33 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }


Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using ignore_changes, the following plan may include actions to undo or
respond to these changes.

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
  ~ update in-place

Terraform will perform the following actions:

  # github_repository.test_devops will be updated in-place
  ~ resource "github_repository" "test_devops" {
      + description                 = "Assignments for DevOps Course at Innopolis University"
      - has_downloads               = true -> null
      - has_projects                = true -> null
        id                          = "test_devops"
        name                        = "test_devops"
        # (31 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

  # github_team.team1 will be created
  + resource "github_team" "team1" {
      + create_default_maintainer = false
      + description               = "Team 1"
      + etag                      = (known after apply)
      + id                        = (known after apply)
      + members_count             = (known after apply)
      + name                      = "team1"
      + node_id                   = (known after apply)
      + parent_team_read_id       = (known after apply)
      + parent_team_read_slug     = (known after apply)
      + privacy                   = "secret"
      + slug                      = (known after apply)
    }

  # github_team.team2 will be created
  + resource "github_team" "team2" {
      + create_default_maintainer = false
      + description               = "Team 2"
      + etag                      = (known after apply)
      + id                        = (known after apply)
      + members_count             = (known after apply)
      + name                      = "team2"
      + node_id                   = (known after apply)
      + parent_team_read_id       = (known after apply)
      + parent_team_read_slug     = (known after apply)
      + privacy                   = "secret"
      + slug                      = (known after apply)
    }

  # github_team_repository.team1_repo will be created
  + resource "github_team_repository" "team1_repo" {
      + etag       = (known after apply)
      + id         = (known after apply)
      + permission = "push"
      + repository = "test_devops"
      + team_id    = (known after apply)
    }

  # github_team_repository.team2_repo will be created
  + resource "github_team_repository" "team2_repo" {
      + etag       = (known after apply)
      + id         = (known after apply)
      + permission = "admin"
      + repository = "test_devops"
      + team_id    = (known after apply)
    }

Plan: 4 to add, 1 to change, 0 to destroy.

Changes to Outputs:
  ~ repo_full_name = "ShohKhan-dev/test_devops" -> "devops-organizational/test_devops"

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

github_team.team2: Creating...
github_team.team1: Creating...
github_repository.test_devops: Modifying... [id=test_devops]
github_team.team1: Still creating... [10s elapsed]
github_team.team2: Still creating... [10s elapsed]
github_repository.test_devops: Still modifying... [id=test_devops, 10s elapsed]
github_repository.test_devops: Modifications complete after 10s [id=test_devops]
github_team.team1: Creation complete after 10s [id=8643636]
github_team_repository.team1_repo: Creating...
github_team.team2: Creation complete after 11s [id=8643637]
github_team_repository.team2_repo: Creating...
github_team_repository.team1_repo: Creation complete after 4s [id=8643636:test_devops]
github_team_repository.team2_repo: Creation complete after 3s [id=8643637:test_devops]

Apply complete! Resources: 4 added, 1 changed, 0 destroyed.

Outputs:

repo_full_name = "devops-organizational/test_devops"
```

## terraform show

```
# github_branch_default.main:
resource "github_branch_default" "main" {
    branch     = "main"
    id         = "test_devops"
    rename     = false
    repository = "test_devops"
}

# github_branch_protection.default:
resource "github_branch_protection" "default" {
    allows_deletions                = false
    allows_force_pushes             = false
    blocks_creations                = false
    enforce_admins                  = true
    force_push_bypassers            = []
    id                              = "BPR_kwDOKYe_vs4CgRRd"
    lock_branch                     = false
    pattern                         = "main"
    push_restrictions               = []
    repository_id                   = "test_devops"
    require_conversation_resolution = true
    require_signed_commits          = false
    required_linear_history         = false

    required_pull_request_reviews {
        dismiss_stale_reviews           = false
        dismissal_restrictions          = []
        pull_request_bypassers          = []
        require_code_owner_reviews      = false
        require_last_push_approval      = false
        required_approving_review_count = 1
        restrict_dismissals             = false
    }
}

# github_repository.test_devops:
resource "github_repository" "test_devops" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = true
    allow_squash_merge          = true
    allow_update_branch         = false
    archived                    = false
    auto_init                   = true
    default_branch              = "main"
    delete_branch_on_merge      = false
    description                 = "Assignments for DevOps Course at Innopolis University"
    etag                        = "W/\"e8647b206d9dc0bf1521e5884df7c61cddd1b42e49d37bd0f24b6fc09d91f493\""
    full_name                   = "devops-organizational/test_devops"
    git_clone_url               = "git://github.com/devops-organizational/test_devops.git"
    has_discussions             = false
    has_downloads               = false
    has_issues                  = true
    has_projects                = false
    has_wiki                    = true
    html_url                    = "https://github.com/devops-organizational/test_devops"
    http_clone_url              = "https://github.com/devops-organizational/test_devops.git"
    id                          = "test_devops"
    is_template                 = false
    license_template            = "mit"
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "test_devops"
    node_id                     = "R_kgDOKYfl_w"
    private                     = false
    repo_id                     = 696772095
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:devops-organizational/test_devops.git"
    svn_url                     = "https://github.com/devops-organizational/test_devops"
    topics                      = []
    visibility                  = "public"
    vulnerability_alerts        = false

    security_and_analysis {
        secret_scanning {
            status = "disabled"
        }
        secret_scanning_push_protection {
    team_id    = "8643636"
}

# github_team_repository.team2_repo:
resource "github_team_repository" "team2_repo" {
    etag       = "W/\"75e8973d9be48eb0ec1bcd0a7a685d076b6e973af3242964b84b1842eb08afa5\""
    id         = "8643637:test_devops"
    permission = "admin"
    repository = "test_devops"
    team_id    = "8643637"
}


Outputs:

repo_full_name = "devops-organizational/test_devops"
```
