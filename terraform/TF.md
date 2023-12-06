## Terraform

### Docker infrastructure

> Note: Docker infrastructure is stored in ./docker/ subfolder as there will be several instances.

> Note: Best practices are at the very bottom of this file

Following the turorial I built inftastructure for my `app_python` using docker container, and here are the outputs of requested commands:

---

`terraform apply`

```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # docker_container.app_python_container will be created
  + resource "docker_container" "app_python_container" {
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
      + name                                        = "app_python_terraform"
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
          + external = 8080
          + internal = 8080
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # docker_image.app_python will be created
  + resource "docker_image" "app_python" {
      + id           = (known after apply)
      + image_id     = (known after apply)
      + keep_locally = false
      + name         = "elatypovinno/devops_inno:latest"
      + repo_digest  = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + container_id = (known after apply)
  + image_id     = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_image.app_python: Creating...
docker_image.app_python: Still creating... [10s elapsed]
docker_image.app_python: Creation complete after 18s [id=sha256:0c585da953ad654d26bc1d0a3a08c58e1563e956134ccfd8594bbbc070e77e3felatypovinno/devops_inno:latest]
docker_container.app_python_container: Creating...
docker_container.app_python_container: Creation complete after 1s [id=fc9045d89fa91daf4f7cf4b059a52b3c7566198ce5fe7c0f17d55a30c0f60da3]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

container_id = "fc9045d89fa91daf4f7cf4b059a52b3c7566198ce5fe7c0f17d55a30c0f60da3"
image_id = "sha256:0c585da953ad654d26bc1d0a3a08c58e1563e956134ccfd8594bbbc070e77e3felatypovinno/devops_inno:latest"
```

---

`terraform show`

```
# docker_container.app_python_container:
resource "docker_container" "app_python_container" {
    attach                                      = false
    command                                     = [
        "python",
        "app.py",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = []
    env                                         = []
    hostname                                    = "fc9045d89fa9"
    id                                          = "fc9045d89fa91daf4f7cf4b059a52b3c7566198ce5fe7c0f17d55a30c0f60da3"
    image                                       = "sha256:0c585da953ad654d26bc1d0a3a08c58e1563e956134ccfd8594bbbc070e77e3f"
    init                                        = false
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "app_python_terraform"
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
    tty                                         = false
    user                                        = "app"
    wait                                        = false
    wait_timeout                                = 60
    working_dir                                 = "/app"

    ports {
        external = 8080
        internal = 8080
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.app_python:
resource "docker_image" "app_python" {
    id           = "sha256:0c585da953ad654d26bc1d0a3a08c58e1563e956134ccfd8594bbbc070e77e3felatypovinno/devops_inno:latest"
    image_id     = "sha256:0c585da953ad654d26bc1d0a3a08c58e1563e956134ccfd8594bbbc070e77e3f"
    keep_locally = false
    name         = "elatypovinno/devops_inno:latest"
    repo_digest  = "elatypovinno/devops_inno@sha256:2505173e38c3876e53a89dbd9f401eae5f8e97dfc0000061463eaf9e6bbd3b19"
}


Outputs:

container_id = "fc9045d89fa91daf4f7cf4b059a52b3c7566198ce5fe7c0f17d55a30c0f60da3"
image_id = "sha256:0c585da953ad654d26bc1d0a3a08c58e1563e956134ccfd8594bbbc070e77e3felatypovinno/devops_inno:latest"
```

---

`terraform state list`

```
docker_container.app_python_container
docker_image.app_python
```

---

`terraform state show`

```bash
terraform state show docker_container.app_python_container
# docker_container.app_python_container:
resource "docker_container" "app_python_container" {
    attach                                      = false
    command                                     = [
        "python",
        "app.py",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = []
    env                                         = []
    hostname                                    = "1f6ba7018d8b"
    id                                          = "1f6ba7018d8b4a0298bd56ac724a5e0daf6abbca6067aba36cc819bb84a7480d"
    image                                       = "sha256:6206b003a898bd4d7771cdf90c2618be50a619b1c4a01bdd88fee4fe6e652d5f"
    init                                        = false
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "app_python_terraform"
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
    tty                                         = false
    user                                        = "app"
    wait                                        = false
    wait_timeout                                = 60
    working_dir                                 = "/app"

    ports {
        external = 8080
        internal = 8080
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}
```

```bash
terraform state show docker_image.app_python
# docker_image.app_python:
resource "docker_image" "app_python" {
    id           = "sha256:6206b003a898bd4d7771cdf90c2618be50a619b1c4a01bdd88fee4fe6e652d5felatypovinno/devops_inno:latest"
    image_id     = "sha256:6206b003a898bd4d7771cdf90c2618be50a619b1c4a01bdd88fee4fe6e652d5f"
    keep_locally = false
    name         = "elatypovinno/devops_inno:latest"
    repo_digest  = "elatypovinno/devops_inno@sha256:5ba20f96386e31ad80b3cf8606bc0cd22141fdbabfe862b84bdd38dee0bb423c"
}
```

---

`terraform output`

```
container_id = "fc9045d89fa91daf4f7cf4b059a52b3c7566198ce5fe7c0f17d55a30c0f60da3"
image_id = "sha256:0c585da953ad654d26bc1d0a3a08c58e1563e956134ccfd8594bbbc070e77e3felatypovinno/devops_inno:latest"
```

---

### Yandex Cloud infrastructure

We prepared terraform infrastructure on Yandex Cloud which created virtual machine and adds our ssh key on `ubuntu` user, so we can access it via ssh.

Here is the outputs of requested commands:

---

`terraform show` (I removed sensitive data from the response)

```
# yandex_compute_instance.yandex-1:
resource "yandex_compute_instance" "yandex-1" {
    created_at                = "2023-09-24T13:52:52Z"
    folder_id                 = "<SENSITIVE>"
    fqdn                      = "<SENSITIVE>"
    id                        = "fhmj671sfaqpnqsq9348"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:<SENSITIVE>
        EOT
    }
    name                      = "yc-terraform"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhm3m7mr34u3cdp74cd2"
        disk_id     = "fhm3m7mr34u3cdp74cd2"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8djv1vmpfdkn5eporh"
            size       = 30
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
        ip_address         = "192.168.10.22"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:13:31:c3:c7"
        nat                = true
        nat_ip_address     = "62.84.112.228"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "<SENSITIVE>"
    }

    placement_policy {
        host_affinity_rules = []
    }

    resources {
        core_fraction = 100
        cores         = 2
        gpus          = 0
        memory        = 2
    }

    scheduling_policy {
        preemptible = false
    }
}

# yandex_vpc_network.network-1:
resource "yandex_vpc_network" "network-1" {
    created_at                = "2023-09-24T13:45:43Z"
    default_security_group_id = "<SENSITIVE>"
    folder_id                 = "<SENSITIVE>"
    id                        = "<SENSITIVE>"
    labels                    = {}
    name                      = "network1"
    subnet_ids                = [
        "<SENSITIVE>",
    ]
}

# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2023-09-24T13:45:45Z"
    folder_id      = "<SENSITIVE>"
    id             = "<SENSITIVE>"
    labels         = {}
    name           = "subnet1"
    network_id     = "enp1tse56cmo1nfg02h2"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}


Outputs:

external_ip_address = "62.84.112.228"
internal_ip_address = "192.168.10.22"
```

---

`terraform state list`

```
yandex_compute_instance.yandex-1
yandex_vpc_network.network-1
yandex_vpc_subnet.subnet-1
```

---

`terraform state show`

```bash
terraform state show yandex_compute_instance.yandex-1
# yandex_compute_instance.yandex-1:
resource "yandex_compute_instance" "yandex-1" {
    created_at                = "2023-09-26T18:38:14Z"
    folder_id                 = "b1gn1ff56fu2r2e4kovg"
    fqdn                      = "fhm0rh8chb89gr7ie07p.auto.internal"
    id                        = "fhm0rh8chb89gr7ie07p"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHOT/NFjq0O/PL0tSIj8KjA/eFNQkmBaG/BUAfEcsF7a coreuser@vi96
        EOT
    }
    name                      = "yc-terraform"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmudjuj753qtv3kgd8g"
        disk_id     = "fhmudjuj753qtv3kgd8g"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd8djv1vmpfdkn5eporh"
            size       = 30
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
        ip_address         = "192.168.10.15"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:dc:50:c8:ad"
        nat                = true
        nat_ip_address     = "51.250.82.203"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9beane3795fg0oftnrc"
    }

    placement_policy {
        host_affinity_rules = []
    }

    resources {
        core_fraction = 100
        cores         = 2
        gpus          = 0
        memory        = 2
    }

    scheduling_policy {
        preemptible = false
    }
}
```

```bash
terraform state show yandex_vpc_network.network-1
# yandex_vpc_network.network-1:
resource "yandex_vpc_network" "network-1" {
    created_at                = "2023-09-26T18:38:10Z"
    default_security_group_id = "enp307k8saj2g0g2k9te"
    folder_id                 = "b1gn1ff56fu2r2e4kovg"
    id                        = "enpr4n9laa82qeusejo1"
    labels                    = {}
    name                      = "network1"
    subnet_ids                = []
}
```

```bash
terraform state show yandex_vpc_subnet.subnet-1
# yandex_vpc_subnet.subnet-1:
resource "yandex_vpc_subnet" "subnet-1" {
    created_at     = "2023-09-26T18:38:12Z"
    folder_id      = "b1gn1ff56fu2r2e4kovg"
    id             = "e9beane3795fg0oftnrc"
    labels         = {}
    name           = "subnet1"
    network_id     = "enpr4n9laa82qeusejo1"
    v4_cidr_blocks = [
        "192.168.10.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}
```
---

`terraform output`

```
external_ip_address = "62.84.112.228"
internal_ip_address = "192.168.10.22"
```

---

By the external IP we can try to connect to created virtual machine by ssh:

```bash
ssh ubuntu@62.84.112.228 -i ~/.ssh/id_ed25519
Welcome to Ubuntu 20.04.4 LTS (GNU/Linux 5.13.0-39-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
New release '22.04.3 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Sun Sep 24 13:54:34 2023 from 207.154.237.246
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@fhmj671sfaqpnqsq9348:~$ whoami
ubuntu
```

---

### Github infrastructure

We prepared github repo as terraform infrastructure and here are the requested commands outputs:

`terraform apply`

```bash
github_repository.repo: Refreshing state... [id=core-course-labs]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
  ~ update in-place

Terraform will perform the following actions:

  # github_branch_default.main will be created
  + resource "github_branch_default" "main" {
      + branch     = "main"
      + id         = (known after apply)
      + repository = "core-course-labs"
    }

  # github_branch_protection.default will be created
  + resource "github_branch_protection" "default" {
      + allows_deletions                = false
      + allows_force_pushes             = false
      + blocks_creations                = false
      + enforce_admins                  = true
      + id                              = (known after apply)
      + pattern                         = "main"
      + repository_id                   = "core-course-labs"
      + require_conversation_resolution = true
      + require_signed_commits          = false
      + required_linear_history         = false

      + required_pull_request_reviews {
          + required_approving_review_count = 1
        }
    }

  # github_repository.repo will be updated in-place
  ~ resource "github_repository" "repo" {
      ~ auto_init                   = false -> true
      + description                 = "Terraform breaks hearts... and repos :("
      + gitignore_template          = "VisualStudio"
      - has_downloads               = true -> null
      ~ has_issues                  = false -> true
      - has_projects                = true -> null
        id                          = "core-course-labs"
      + license_template            = "mit"
        name                        = "core-course-labs"
        # (27 unchanged attributes hidden)
    }

Plan: 2 to add, 1 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

github_repository.repo: Modifying... [id=core-course-labs]
github_repository.repo: Modifications complete after 2s [id=core-course-labs]
github_branch_default.main: Creating...
github_branch_default.main: Creation complete after 2s [id=core-course-labs]
github_branch_protection.default: Creating...
github_branch_protection.default: Creation complete after 4s [id=BPR_kwDOKYpYKs4CgUgT]

Apply complete! Resources: 2 added, 1 changed, 0 destroyed
```

---

`terraform show`

```bash
# github_branch_default.main:
resource "github_branch_default" "main" {
    branch     = "main"
    id         = "core-course-labs"
    repository = "core-course-labs"
}

# github_branch_protection.default:
resource "github_branch_protection" "default" {
    allows_deletions                = false
    allows_force_pushes             = false
    blocks_creations                = false
    enforce_admins                  = true
    id                              = "BPR_kwDOKYpYKs4CgUgT"
    pattern                         = "main"
    push_restrictions               = []
    repository_id                   = "core-course-labs"
    require_conversation_resolution = true
    require_signed_commits          = false
    required_linear_history         = false

    required_pull_request_reviews {
        dismiss_stale_reviews           = false
        dismissal_restrictions          = []
        pull_request_bypassers          = []
        require_code_owner_reviews      = false
        required_approving_review_count = 0
        restrict_dismissals             = false
    }
}

# github_repository.repo:
resource "github_repository" "repo" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = true
    allow_squash_merge          = true
    archived                    = false
    auto_init                   = true
    branches                    = [
        {
            name      = "lab1"
            protected = false
        },
        {
            name      = "lab2"
            protected = false
        },
        {
            name      = "lab3"
            protected = false
        },
        {
            name      = "lab4"
            protected = false
        },
        {
            name      = "main"
            protected = true
        },
    ]
    default_branch              = "main"
    delete_branch_on_merge      = false
    description                 = "Terraform breaks hearts... and repos :("
    etag                        = "W/\"fc3f81a0356b37f8a41e4cc2f9e4c55c636d18ed7e33b83f99560e902024a19a\""
    full_name                   = "Sl1va/core-course-labs"
    git_clone_url               = "git://github.com/Sl1va/core-course-labs.git"
    gitignore_template          = "VisualStudio"
    has_downloads               = false
    has_issues                  = true
    has_projects                = false
    has_wiki                    = true
    html_url                    = "https://github.com/Sl1va/core-course-labs"
    http_clone_url              = "https://github.com/Sl1va/core-course-labs.git"
    id                          = "core-course-labs"
    is_template                 = false
    license_template            = "mit"
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "core-course-labs"
    node_id                     = "R_kgDOKYpYKg"
    private                     = false
    repo_id                     = 696932394
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:Sl1va/core-course-labs.git"
    svn_url                     = "https://github.com/Sl1va/core-course-labs"
    topics                      = []
    visibility                  = "public"
    vulnerability_alerts        = false
}


Outputs:

default_branch = "main"
repository_description = "Terraform breaks hearts... and repos :("
repository_enforce_admins = true
repository_name = "core-course-labs"
repository_require_conversation_resolution = true
repository_required_approving_review_count = 0
repository_visibility = "public"
```

---

`terraform state list`

```bash
github_branch_default.main
github_branch_protection.default
github_repository.repo
```

---

`terraform state show`

```bash
terraform state show github_branch_default.main
# github_branch_default.main:
resource "github_branch_default" "main" {
    branch     = "main"
    id         = "core-course-labs"
    repository = "core-course-labs"
}
```

```bash
terraform state show github_branch_protection.default
# github_branch_protection.default:
resource "github_branch_protection" "default" {
    allows_deletions                = false
    allows_force_pushes             = false
    blocks_creations                = false
    enforce_admins                  = true
    id                              = "BPR_kwDOKYpYKs4CgUgT"
    pattern                         = "main"
    push_restrictions               = []
    repository_id                   = "core-course-labs"
    require_conversation_resolution = true
    require_signed_commits          = false
    required_linear_history         = false

    required_pull_request_reviews {
        dismiss_stale_reviews           = false
        dismissal_restrictions          = []
        pull_request_bypassers          = []
        require_code_owner_reviews      = false
        required_approving_review_count = 0
        restrict_dismissals             = false
    }
}
```

```bash
terraform state show github_repository.repo
# github_repository.repo:
resource "github_repository" "repo" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = true
    allow_squash_merge          = true
    archived                    = false
    auto_init                   = true
    branches                    = [
        {
            name      = "lab1"
            protected = false
        },
        {
            name      = "lab2"
            protected = false
        },
        {
            name      = "lab3"
            protected = false
        },
        {
            name      = "lab4"
            protected = false
        },
        {
            name      = "main"
            protected = true
        },
    ]
    default_branch              = "main"
    delete_branch_on_merge      = false
    description                 = "Terraform breaks hearts... and repos :("
    etag                        = "W/\"fc3f81a0356b37f8a41e4cc2f9e4c55c636d18ed7e33b83f99560e902024a19a\""
    full_name                   = "Sl1va/core-course-labs"
    git_clone_url               = "git://github.com/Sl1va/core-course-labs.git"
    gitignore_template          = "VisualStudio"
    has_downloads               = false
    has_issues                  = true
    has_projects                = false
    has_wiki                    = true
    html_url                    = "https://github.com/Sl1va/core-course-labs"
    http_clone_url              = "https://github.com/Sl1va/core-course-labs.git"
    id                          = "core-course-labs"
    is_template                 = false
    license_template            = "mit"
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "core-course-labs"
    node_id                     = "R_kgDOKYpYKg"
    private                     = false
    repo_id                     = 696932394
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:Sl1va/core-course-labs.git"
    svn_url                     = "https://github.com/Sl1va/core-course-labs"
    topics                      = []
    visibility                  = "public"
    vulnerability_alerts        = false
}
```

---

`terraform output`

```
default_branch = "main"
repository_description = "Terraform breaks hearts... and repos :("
repository_enforce_admins = true
repository_name = "core-course-labs"
repository_require_conversation_resolution = true
repository_required_approving_review_count = 0
repository_visibility = "public"
```

---

### Terraform best practices

There are several best practices in terraform usage, which may improve experience of using terraform, and especially helped me to build this project in the best way:

- Use modules for code reuse: Modules allow you to encapsulate related resources and to reuse your code across different environments, reducing the possibility of errors and increasing maintainability.

- Plan before apply: Always run terraform plan before terraform apply to understand what changes will be made. This can help prevent unintended modifications.

- Sensitive data handling: Never hard-code sensitive data like passwords or API keys. Use input variables.