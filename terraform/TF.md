<!-- TOC -->

- [Markdown Navigation](#markdown-navigation)
  - [Applied Best Practices](#applied-best-practices)
  - [Docker](#docker)
  - [AWS](#aws)
  - [Github](#github)
  - [Github Teams](#github-teams)
  <!-- /TOC -->

# Applied Best Practices

- main.tf is divided into main.tf, variables.tf, and outputs.tf
- used terraform validate for validation
- used terraform fmt
- description is included on all variables
- secrets are kept in environment variables instead of inside the code

# Docker

## terraform apply

```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.app_python.docker_container.python_app will be created
  + resource "docker_container" "python_app" {
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
      + image                                       = (known after apply)
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

  # module.app_python.docker_image.python_image will be created
  + resource "docker_image" "python_image" {
      + id           = (known after apply)
      + image_id     = (known after apply)
      + keep_locally = false
      + name         = "nikolina2k/ma-repo:latest"
      + repo_digest  = (known after apply)
    }

  # module.app_typescript.docker_container.python_app will be created
  + resource "docker_container" "python_app" {
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
      + image                                       = (known after apply)
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

  # module.app_typescript.docker_image.python_image will be created
  + resource "docker_image" "python_image" {
      + id           = (known after apply)
      + image_id     = (known after apply)
      + keep_locally = false
      + name         = "nikolina2k/cat-pics:latest"
      + repo_digest  = (known after apply)
    }

Plan: 4 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + python_container_id     = (known after apply)
  + typescript_container_id = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.app_typescript.docker_image.python_image: Creating...
module.app_python.docker_image.python_image: Creating...
module.app_python.docker_image.python_image: Creation complete after 0s [id=sha256:44e1e48c3a39d84facda5f72bc4afe87b5864be604f22437fb3fc9e15172bc00nikolina2k/ma-repo:latest]
module.app_typescript.docker_image.python_image: Creation complete after 0s [id=sha256:e532adac0fd19099f5e1f1913b33b2ba0067caeacb987358e3f70449b6dc5863nikolina2k/cat-pics:latest]
module.app_python.docker_container.python_app: Creating...
module.app_typescript.docker_container.python_app: Creating...
module.app_python.docker_container.python_app: Creation complete after 2s [id=c148e3fbf312c14dd1af34afe15ab6d62b00ef817b03840c8b32bcd63f61903b]
module.app_typescript.docker_container.python_app: Creation complete after 2s [id=e67128aaa3d7cf7923a7643dd87292c2437085354cff536d3cac2a20d855a535]

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.

Outputs:

python_container_id = "c148e3fbf312c14dd1af34afe15ab6d62b00ef817b03840c8b32bcd63f61903b"
typescript_container_id = "e67128aaa3d7cf7923a7643dd87292c2437085354cff536d3cac2a20d855a535"
```

## terraform state list

```
module.app_python.docker_container.python_app
module.app_python.docker_image.python_image
module.app_typescript.docker_container.python_app
module.app_typescript.docker_image.python_image
```

## terraform plan (after changing image name)

```
module.app_typescript.docker_image.python_image: Refreshing state... [id=sha256:e532adac0fd19099f5e1f1913b33b2ba0067caeacb987358e3f70449b6dc5863nikolina2k/cat-pics:latest]
module.app_python.docker_image.python_image: Refreshing state... [id=sha256:44e1e48c3a39d84facda5f72bc4afe87b5864be604f22437fb3fc9e15172bc00nikolina2k/ma-repo:latest]
module.app_typescript.docker_container.python_app: Refreshing state... [id=e67128aaa3d7cf7923a7643dd87292c2437085354cff536d3cac2a20d855a535]
module.app_python.docker_container.python_app: Refreshing state... [id=c148e3fbf312c14dd1af34afe15ab6d62b00ef817b03840c8b32bcd63f61903b]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
  - destroy
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # module.app_python.docker_container.python_app must be replaced
-/+ resource "docker_container" "python_app" {
      + bridge                                      = (known after apply)
      ~ command                                     = [
          - "nginx",
          - "-g",
          - "daemon off;",
        ] -> (known after apply)
      + container_logs                              = (known after apply)
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      ~ entrypoint                                  = [
          - "/docker-entrypoint.sh",
        ] -> (known after apply)
      ~ env                                         = [] -> (known after apply)
      + exit_code                                   = (known after apply)
      - group_add                                   = [] -> null
      ~ hostname                                    = "c148e3fbf312" -> (known after apply)
      ~ id                                          = "c148e3fbf312c14dd1af34afe15ab6d62b00ef817b03840c8b32bcd63f61903b" -> (known after apply)
      ~ image                                       = "sha256:44e1e48c3a39d84facda5f72bc4afe87b5864be604f22437fb3fc9e15172bc00" # forces replacement -> (known after apply) # forces replacement
      ~ init                                        = false -> (known after apply)
      ~ ipc_mode                                    = "private" -> (known after apply)
      ~ log_driver                                  = "json-file" -> (known after apply)
      - log_opts                                    = {} -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
        name                                        = "my_python_app"
      ~ network_data                                = [
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
        ] -> (known after apply)
      - network_mode                                = "default" -> null
      - privileged                                  = false -> null
      - publish_all_ports                           = false -> null
      ~ runtime                                     = "runc" -> (known after apply)
      ~ security_opts                               = [] -> (known after apply)
      ~ shm_size                                    = 64 -> (known after apply)
      ~ stop_signal                                 = "SIGQUIT" -> (known after apply)
      ~ stop_timeout                                = 0 -> (known after apply)
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
      - user                                        = "101" -> null
        # (13 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

  # module.app_python.docker_image.cute_python_image will be created
  + resource "docker_image" "cute_python_image" {
      + id           = (known after apply)
      + image_id     = (known after apply)
      + keep_locally = false
      + name         = "nikolina2k/ma-repo:latest"
      + repo_digest  = (known after apply)
    }

  # module.app_python.docker_image.python_image will be destroyed
  # (because docker_image.python_image is not in configuration)
  - resource "docker_image" "python_image" {
      - id           = "sha256:44e1e48c3a39d84facda5f72bc4afe87b5864be604f22437fb3fc9e15172bc00nikolina2k/ma-repo:latest" -> null
      - image_id     = "sha256:44e1e48c3a39d84facda5f72bc4afe87b5864be604f22437fb3fc9e15172bc00" -> null
      - keep_locally = false -> null
      - name         = "nikolina2k/ma-repo:latest" -> null
      - repo_digest  = "nikolina2k/ma-repo@sha256:152d8aea6b7495e95eb3c95650453abd9574ce098266fe4ef5878fbcaa421ba0" -> null
    }

  # module.app_typescript.docker_container.python_app must be replaced
-/+ resource "docker_container" "python_app" {
      + bridge                                      = (known after apply)
      ~ command                                     = [
          - "nginx",
          - "-g",
          - "daemon off;",
        ] -> (known after apply)
      + container_logs                              = (known after apply)
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      ~ entrypoint                                  = [
          - "/docker-entrypoint.sh",
        ] -> (known after apply)
      ~ env                                         = [] -> (known after apply)
      + exit_code                                   = (known after apply)
      - group_add                                   = [] -> null
      ~ hostname                                    = "e67128aaa3d7" -> (known after apply)
      ~ id                                          = "e67128aaa3d7cf7923a7643dd87292c2437085354cff536d3cac2a20d855a535" -> (known after apply)
      ~ image                                       = "sha256:e532adac0fd19099f5e1f1913b33b2ba0067caeacb987358e3f70449b6dc5863" # forces replacement -> (known after apply) # forces replacement
      ~ init                                        = false -> (known after apply)
      ~ ipc_mode                                    = "private" -> (known after apply)
      ~ log_driver                                  = "json-file" -> (known after apply)
      - log_opts                                    = {} -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
        name                                        = "my_typescript_app"
      ~ network_data                                = [
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
        ] -> (known after apply)
      - network_mode                                = "default" -> null
      - privileged                                  = false -> null
      - publish_all_ports                           = false -> null
      ~ runtime                                     = "runc" -> (known after apply)
      ~ security_opts                               = [] -> (known after apply)
      ~ shm_size                                    = 64 -> (known after apply)
      ~ stop_signal                                 = "SIGQUIT" -> (known after apply)
      ~ stop_timeout                                = 0 -> (known after apply)
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
      - user                                        = "101" -> null
        # (13 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

  # module.app_typescript.docker_image.cute_python_image will be created
  + resource "docker_image" "cute_python_image" {
      + id           = (known after apply)
      + image_id     = (known after apply)
      + keep_locally = false
      + name         = "nikolina2k/cat-pics:latest"
      + repo_digest  = (known after apply)
    }

  # module.app_typescript.docker_image.python_image will be destroyed
  # (because docker_image.python_image is not in configuration)
  - resource "docker_image" "python_image" {
      - id           = "sha256:e532adac0fd19099f5e1f1913b33b2ba0067caeacb987358e3f70449b6dc5863nikolina2k/cat-pics:latest" -> null
      - image_id     = "sha256:e532adac0fd19099f5e1f1913b33b2ba0067caeacb987358e3f70449b6dc5863" -> null
      - keep_locally = false -> null
      - name         = "nikolina2k/cat-pics:latest" -> null
    }

Plan: 4 to add, 0 to change, 4 to destroy.

Changes to Outputs:
  ~ python_container_id     = "c148e3fbf312c14dd1af34afe15ab6d62b00ef817b03840c8b32bcd63f61903b" -> (known after apply)
  ~ typescript_container_id = "e67128aaa3d7cf7923a7643dd87292c2437085354cff536d3cac2a20d855a535" -> (known after apply)
```

# AWS

## terraform show

```
# aws_instance.myserver:
resource "aws_instance" "myserver" {
    ami                                  = "ami-08d70e59c07c61a3a"
    arn                                  = "arn:aws:ec2:us-west-2:580563234576:instance/i-04d23cdd963d75c0b"
    associate_public_ip_address          = true
    availability_zone                    = "us-west-2b"
    cpu_core_count                       = 1
    cpu_threads_per_core                 = 1
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    id                                   = "i-04d23cdd963d75c0b"
    instance_initiated_shutdown_behavior = "stop"
    instance_state                       = "running"
    instance_type                        = "t2.micro"
    ipv6_address_count                   = 0
    ipv6_addresses                       = []
    monitoring                           = false
    placement_partition_number           = 0
    primary_network_interface_id         = "eni-08ed0d74031a3fc33"
    private_dns                          = "ip-172-31-24-186.us-west-2.compute.internal"
    private_ip                           = "172.31.24.186"
    public_dns                           = "ec2-54-149-156-186.us-west-2.compute.amazonaws.com"
    public_ip                            = "54.149.156.186"
    secondary_private_ips                = []
    security_groups                      = [
        "default",
    ]
    source_dest_check                    = true
    subnet_id                            = "subnet-0b999c5d212d7762f"
    tags                                 = {
        "Name" = "ExampleAppServerInstance"
    }
    tags_all                             = {
        "Name" = "ExampleAppServerInstance"
    }
    tenancy                              = "default"
    user_data_replace_on_change          = false
    vpc_security_group_ids               = [
        "sg-02c53912ed412ff55",
    ]

    capacity_reservation_specification {
        capacity_reservation_preference = "open"
    }

    cpu_options {
        core_count       = 1
        threads_per_core = 1
    }

    credit_specification {
        cpu_credits = "standard"
    }

    enclave_options {
        enabled = false
    }

    maintenance_options {
        auto_recovery = "default"
    }

    metadata_options {
        http_endpoint               = "enabled"
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
        iops                  = 100
        tags                  = {}
        throughput            = 0
        volume_id             = "vol-0eeb13f3aed7b6e76"
        volume_size           = 8
        volume_type           = "gp2"
    }
}


Outputs:

instance_id = "i-04d23cdd963d75c0b"
instance_public_ip = "54.149.156.186"
```

## terraform state list

```
aws_instance.myserver
```

## terraform plan (after changing ami)

```
aws_instance.myserver: Refreshing state... [id=i-04d23cdd963d75c0b]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_instance.myserver must be replaced
-/+ resource "aws_instance" "myserver" {
      ~ ami                                  = "ami-08d70e59c07c61a3a" -> "ami-830c94e3" # forces replacement
      ~ arn                                  = "arn:aws:ec2:us-west-2:580563234576:instance/i-04d23cdd963d75c0b" -> (known after apply)
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
      ~ id                                   = "i-04d23cdd963d75c0b" -> (known after apply)
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
      ~ primary_network_interface_id         = "eni-08ed0d74031a3fc33" -> (known after apply)
      ~ private_dns                          = "ip-172-31-24-186.us-west-2.compute.internal" -> (known after apply)
      ~ private_ip                           = "172.31.24.186" -> (known after apply)
      ~ public_dns                           = "ec2-54-149-156-186.us-west-2.compute.amazonaws.com" -> (known after apply)
      ~ public_ip                            = "54.149.156.186" -> (known after apply)
      ~ secondary_private_ips                = [] -> (known after apply)
      ~ security_groups                      = [
          - "default",
        ] -> (known after apply)
      ~ subnet_id                            = "subnet-0b999c5d212d7762f" -> (known after apply)
        tags                                 = {
            "Name" = "ExampleAppServerInstance"
        }
      ~ tenancy                              = "default" -> (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      ~ vpc_security_group_ids               = [
          - "sg-02c53912ed412ff55",
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
          - volume_id             = "vol-0eeb13f3aed7b6e76" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp2" -> null
        }
    }

Plan: 1 to add, 0 to change, 1 to destroy.
```

# Github

## terraform show

```
# github_branch_default.main:
resource "github_branch_default" "main" {
    branch     = "main"
    id         = "ma-cute-repo"
    rename     = false
    repository = "ma-cute-repo"
}

# github_branch_protection.default:
resource "github_branch_protection" "default" {
    allows_deletions                = false
    allows_force_pushes             = false
    blocks_creations                = false
    enforce_admins                  = true
    id                              = "BPR_kwDOKYtSEs4CgWG-"
    lock_branch                     = false
    pattern                         = "main"
    repository_id                   = "ma-cute-repo"
    require_conversation_resolution = true
    require_signed_commits          = false
    required_linear_history         = false

    required_pull_request_reviews {
        dismiss_stale_reviews           = false
        require_code_owner_reviews      = false
        require_last_push_approval      = false
        required_approving_review_count = 1
        restrict_dismissals             = false
    }
}

# github_repository.ma-cute-repo:
resource "github_repository" "ma-cute-repo" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = true
    allow_squash_merge          = true
    allow_update_branch         = false
    archived                    = false
    auto_init                   = true
    default_branch              = "main"
    delete_branch_on_merge      = false
    description                 = "DevOps Course at Innopolis University"
    etag                        = "W/\"0b1ba7b77a506710867614795c7428e292816bae52a6b928386d1b01a44ab27f\""
    full_name                   = "nikolina2k/ma-cute-repo"
    git_clone_url               = "git://github.com/nikolina2k/ma-cute-repo.git"
    has_discussions             = false
    has_downloads               = false
    has_issues                  = true
    has_projects                = false
    has_wiki                    = true
    html_url                    = "https://github.com/nikolina2k/ma-cute-repo"
    http_clone_url              = "https://github.com/nikolina2k/ma-cute-repo.git"
    id                          = "ma-cute-repo"
    is_template                 = false
    license_template            = "mit"
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "ma-cute-repo"
    node_id                     = "R_kgDOKYtSEg"
    private                     = false
    repo_id                     = 696996370
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:nikolina2k/ma-cute-repo.git"
    svn_url                     = "https://github.com/nikolina2k/ma-cute-repo"
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

repo_full_name = "nikolina2k/ma-cute-repo"
```

## terraform state list

```
github_branch_default.main
github_branch_protection.default
github_repository.ma-cute-repo
```

# Github Teams

## terraform plan (after modifying github to github teams)

```
github_repository.ma-cute-repo: Refreshing state... [id=ma-cute-repo]
github_branch_default.main: Refreshing state... [id=ma-cute-repo]
github_branch_protection.default: Refreshing state... [id=BPR_kwDOKYtSEs4CgWG-]

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last "terraform apply" which may have affected this plan:

  # github_repository.ma-cute-repo has changed
  ~ resource "github_repository" "ma-cute-repo" {
      ~ full_name                   = "nikolina2k/ma-cute-repo" -> "my-cute-organization/ma-cute-repo"
        id                          = "ma-cute-repo"
        name                        = "ma-cute-repo"
        # (33 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }


Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using ignore_changes, the following plan may include actions to undo or respond to these changes.

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
  ~ update in-place

Terraform will perform the following actions:

  # github_repository.ma-cute-repo will be updated in-place
  ~ resource "github_repository" "ma-cute-repo" {
      + description                 = "DevOps Course at Innopolis University"
      - has_downloads               = true -> null
      - has_projects                = true -> null
        id                          = "ma-cute-repo"
        name                        = "ma-cute-repo"
        # (31 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

  # github_team.blue will be created
  + resource "github_team" "blue" {
      + create_default_maintainer = false
      + description               = "Team Blue"
      + etag                      = (known after apply)
      + id                        = (known after apply)
      + members_count             = (known after apply)
      + name                      = "blue"
      + node_id                   = (known after apply)
      + parent_team_read_id       = (known after apply)
      + parent_team_read_slug     = (known after apply)
      + privacy                   = "secret"
      + slug                      = (known after apply)
    }

  # github_team.pink will be created
  + resource "github_team" "pink" {
      + create_default_maintainer = false
      + description               = "Team Pink"
      + etag                      = (known after apply)
      + id                        = (known after apply)
      + members_count             = (known after apply)
      + name                      = "pink"
      + node_id                   = (known after apply)
      + parent_team_read_id       = (known after apply)
      + parent_team_read_slug     = (known after apply)
      + privacy                   = "secret"
      + slug                      = (known after apply)
    }

  # github_team_repository.blue_repo will be created
  + resource "github_team_repository" "blue_repo" {
      + etag       = (known after apply)
      + id         = (known after apply)
      + permission = "admin"
      + repository = "ma-cute-repo"
      + team_id    = (known after apply)
    }

  # github_team_repository.pink_repo will be created
  + resource "github_team_repository" "pink_repo" {
      + etag       = (known after apply)
      + id         = (known after apply)
      + permission = "push"
      + repository = "ma-cute-repo"
      + team_id    = (known after apply)
    }

Plan: 4 to add, 1 to change, 0 to destroy.

Changes to Outputs:
  ~ repo_full_name = "nikolina2k/ma-cute-repo" -> "my-cute-organization/ma-cute-repo"
```

## terraform apply

```
# github_branch_default.main:
resource "github_branch_default" "main" {
    branch     = "main"
    id         = "ma-cute-repo"
    rename     = false
    repository = "ma-cute-repo"
}

# github_branch_protection.default:
resource "github_branch_protection" "default" {
    allows_deletions                = false
    allows_force_pushes             = false
    blocks_creations                = false
    enforce_admins                  = true
    force_push_bypassers            = []
    id                              = "BPR_kwDOKYtSEs4CgWG-"
    lock_branch                     = false
    pattern                         = "main"
    push_restrictions               = []
    repository_id                   = "ma-cute-repo"
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

# github_repository.ma-cute-repo:
resource "github_repository" "ma-cute-repo" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = true
    allow_squash_merge          = true
    allow_update_branch         = false
    archived                    = false
    auto_init                   = true
    default_branch              = "main"
    delete_branch_on_merge      = false
    description                 = "DevOps Course at Innopolis University"
    etag                        = "W/\"41c90a7838788443ca6bc468067bc2068575a425f5901f75df012fd5ee4da392\""
    full_name                   = "my-cute-organization/ma-cute-repo"
    git_clone_url               = "git://github.com/my-cute-organization/ma-cute-repo.git"
    has_discussions             = false
    has_downloads               = false
    has_issues                  = true
    has_projects                = false
    has_wiki                    = true
    html_url                    = "https://github.com/my-cute-organization/ma-cute-repo"
    http_clone_url              = "https://github.com/my-cute-organization/ma-cute-repo.git"
    id                          = "ma-cute-repo"
    is_template                 = false
    license_template            = "mit"
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "ma-cute-repo"
    node_id                     = "R_kgDOKYtZvA"
    private                     = false
    repo_id                     = 696998332
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:my-cute-organization/ma-cute-repo.git"
    svn_url                     = "https://github.com/my-cute-organization/ma-cute-repo"
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

# github_team.blue:
resource "github_team" "blue" {
    create_default_maintainer = false
    description               = "Team Blue"
    etag                      = "W/\"d25d7743bd6b02497a52a4eeca1e19c13a1f6beaccfea36a4688b0f058d819b5\""
    id                        = "8646794"
    members_count             = 0
    name                      = "blue"
    node_id                   = "T_kwDOCLXde84Ag_CK"
    privacy                   = "secret"
    slug                      = "blue"
}

# github_team.pink:
resource "github_team" "pink" {
    create_default_maintainer = false
    description               = "Team Pink"
    etag                      = "W/\"ea7ef14ab1fb21ae07835dafa0d0c4d2c7e6c27f1849ee8c0e92a2a21343fdfb\""
    id                        = "8646795"
    members_count             = 0
    name                      = "pink"
    node_id                   = "T_kwDOCLXde84Ag_CL"
    privacy                   = "secret"
    slug                      = "pink"
}

# github_team_repository.blue_repo:
resource "github_team_repository" "blue_repo" {
    etag       = "W/\"d118ada5d44109b05c7d9ce54aea95450aca7d317edf8357413dcbf793466b7a\""
    id         = "8646794:ma-cute-repo"
    permission = "admin"
    repository = "ma-cute-repo"
    team_id    = "8646794"
}

# github_team_repository.pink_repo:
resource "github_team_repository" "pink_repo" {
    etag       = "W/\"eeb75f8d520119191e61db583837675a3b38a47707fcdaba27b494146e62cc04\""
    id         = "8646795:ma-cute-repo"
    permission = "push"
    repository = "ma-cute-repo"
    team_id    = "8646795"
}


Outputs:

repo_full_name = "my-cute-organization/ma-cute-repo"
```

## terraform state list

```
github_branch_default.main
github_branch_protection.default
github_repository.ma-cute-repo
github_team.blue
github_team.pink
github_team_repository.blue_repo
github_team_repository.pink_repo
```
