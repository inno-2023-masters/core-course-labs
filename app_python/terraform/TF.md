## DOCKER

<details> <summary> Spoiler </summary> 

```
➜  docker git:(lab4) ✗ tf state list
docker_container.app_python
docker_image.app_python
```

<details> <summary> docker_image.app_python and docker_container.app_python </summary>

```
➜  docker git:(lab4) ✗ tf state show docker_image.app_python
# docker_image.app_python:
resource "docker_image" "app_python" {
    id           = "sha256:9cbf91966df4b4160414dd20df81450cbeba839865dd1961b3a63532dd0f5a03wiirtex/python_time_service:0.2.0"
    image_id     = "sha256:9cbf91966df4b4160414dd20df81450cbeba839865dd1961b3a63532dd0f5a03"
    keep_locally = false
    name         = "wiirtex/python_time_service:0.2.0"
    repo_digest  = "wiirtex/python_time_service@sha256:7ac8ee903951245fe7fb880a87868d0c28eea0a2e8325124dcc28631ec24fd9f"
}

➜  docker git:(lab4) ✗ tf state show docker_container.app_python
# docker_container.app_python:
resource "docker_container" "app_python" {
    attach                                      = false
    command                                     = [
        "/bin/sh",
        "-c",
        ". ~/opt/venv/bin/activate && exec python app_python/src/main.py",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = []
    env                                         = []
    hostname                                    = "e49ad91ba5b3"
    id                                          = "e49ad91ba5b3706fb074a90ab9ac1e796d175245f0c968bd75a037ab34395649"
    image                                       = "sha256:9cbf91966df4b4160414dd20df81450cbeba839865dd1961b3a63532dd0f5a03"
    init                                        = false
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "app_python"
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
    user                                        = "python_runner"
    wait                                        = false
    wait_timeout                                = 60
    working_dir                                 = "/home/python_runner/python/src/app"

    ports {
        external = 7098
        internal = 7098
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}
```

</details>

```
➜  docker git:(lab4) ✗ tf output
container_id = "e49ad91ba5b3706fb074a90ab9ac1e796d175245f0c968bd75a037ab34395649"
image_id = "sha256:9cbf91966df4b4160414dd20df81450cbeba839865dd1961b3a63532dd0f5a03wiirtex/python_time_service:0.2.0"
```

</details>

## YANDEX

<details> <summary> Spoiler </summary> 

```
➜  yandex git:(lab4) ✗ tf state list                     
yandex_compute_instance.my_vm
yandex_vpc_network.my_network
yandex_vpc_subnet.my_subnetwork
```

<details> <summary> yandex_compute_instance.my_vm </summary>

```
➜  yandex git:(lab4) ✗ tf state show yandex_compute_instance.my_vm
# yandex_compute_instance.my_vm:
resource "yandex_compute_instance" "my_vm" {
    created_at                = "2023-09-26T20:22:03Z"
    folder_id                 = "b1g5pgfas4utv31ktp1u"
    fqdn                      = "epdqiqj5qfsipioq3gar.auto.internal"
    id                        = "epdqiqj5qfsipioq3gar"
    name                      = "terraform-vm"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-b"

    boot_disk {
        auto_delete = true
        device_name = "epd9k5r82a7admmon495"
        disk_id     = "epd9k5r82a7admmon495"
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
        ip_address         = "10.129.0.30"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:1a:96:a6:5d"
        nat                = false
        security_group_ids = []
        subnet_id          = "e2lvbv14cnm43upaso1f"
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
```

</details>



<details> <summary> yandex_vpc_network.my_network </summary>

```
➜  yandex git:(lab4) ✗ tf state show yandex_vpc_network.my_network
# yandex_vpc_network.my_network:
resource "yandex_vpc_network" "my_network" {
    created_at                = "2023-09-26T20:21:59Z"
    default_security_group_id = "enp82meje01p97md8a4s"
    folder_id                 = "b1g5pgfas4utv31ktp1u"
    id                        = "enpqgmio59rc3ive2kl1"
    labels                    = {}
    name                      = "terraform-network"
    subnet_ids                = []
}
```

</details>

<details> <summary> yandex_vpc_subnet.my_subnetwork </summary>

```
➜  yandex git:(lab4) ✗ tf state show yandex_vpc_subnet.my_subnetwork
# yandex_vpc_subnet.my_subnetwork:
resource "yandex_vpc_subnet" "my_subnetwork" {
    created_at     = "2023-09-26T20:22:01Z"
    folder_id      = "b1g5pgfas4utv31ktp1u"
    id             = "e2lvbv14cnm43upaso1f"
    labels         = {}
    name           = "terraform-network-ru-central1-b"
    network_id     = "enpqgmio59rc3ive2kl1"
    v4_cidr_blocks = [
        "10.129.0.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-b"
}
```

</details>

```
➜  docker git:(lab4) ✗ tf output
instance_created_at = "2023-09-26T20:22:03Z"
instance_id = "epdqiqj5qfsipioq3gar"
```

</details>

## GITHUB

<details> <summary> Spoiler </summary>

```
➜  github git:(lab4) ✗ tf state list
github_branch_default.main
github_branch_protection.default
github_repository.devops-labs-tf
github_team.teamA
github_team.teamB
github_team_repository.teamA_repo
github_team_repository.teamB_repo
```

<details> <summary> github_branch_default.main </summary>

```
➜  github git:(lab4) ✗ tf state show github_branch_default.main
# github_branch_default.main:
resource "github_branch_default" "main" {
    branch     = "main"
    id         = "devops-labs-tf"
    repository = "devops-labs-tf"
}
```

</details>

<details> <summary> github_branch_protection.default </summary>

```
➜  github git:(lab4) ✗ tf state show github_branch_protection.default
# github_branch_protection.default:
resource "github_branch_protection" "default" {
    allows_deletions                = false
    allows_force_pushes             = false
    blocks_creations                = false
    enforce_admins                  = true
    id                              = "BPR_kwDOKYt7Ls4CgWjH"
    pattern                         = "main"
    push_restrictions               = []
    repository_id                   = "devops-labs-tf"
    require_conversation_resolution = true
    require_signed_commits          = false
    required_linear_history         = false

    required_pull_request_reviews {
        dismiss_stale_reviews           = false
        dismissal_restrictions          = []
        pull_request_bypassers          = []
        require_code_owner_reviews      = false
        required_approving_review_count = 1
        restrict_dismissals             = false
    }
}
```

</details>

<details> <summary> github_repository.devops-labs-tf </summary>

```
➜  github git:(lab4) ✗ tf state show github_repository.devops-labs-tf
# github_repository.devops-labs-tf:
resource "github_repository" "devops-labs-tf" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = true
    allow_squash_merge          = true
    archived                    = false
    auto_init                   = true
    branches                    = []
    default_branch              = "main"
    delete_branch_on_merge      = false
    etag                        = "W/\"f8c80f97f874c04c8a1133ba27db00780183d1d2a2fb95e7e164a318b92b2526\""
    full_name                   = "devops-labs-wiirtex/devops-labs-tf"
    git_clone_url               = "git://github.com/devops-labs-wiirtex/devops-labs-tf.git"
    has_downloads               = false
    has_issues                  = true
    has_projects                = false
    has_wiki                    = true
    html_url                    = "https://github.com/devops-labs-wiirtex/devops-labs-tf"
    http_clone_url              = "https://github.com/devops-labs-wiirtex/devops-labs-tf.git"
    id                          = "devops-labs-tf"
    is_template                 = false
    license_template            = "mit"
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "devops-labs-tf"
    node_id                     = "R_kgDOKYuGsg"
    private                     = false
    repo_id                     = 697009842
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:devops-labs-wiirtex/devops-labs-tf.git"
    svn_url                     = "https://github.com/devops-labs-wiirtex/devops-labs-tf"
    topics                      = []
    visibility                  = "public"
    vulnerability_alerts        = false
}
```

</details>

<details> <summary> github_team.teamA </summary>

```
➜  github git:(lab4) ✗ tf state show github_team.teamA
# github_team.teamA:
resource "github_team" "teamA" {
    create_default_maintainer = false
    description               = "Team A group"
    etag                      = "W/\"3f08e640f73ad9d582b1e5a144d875e3801d51d863b9d127b08076a23268e98c\""
    id                        = "8646977"
    members_count             = 0
    name                      = "teamA"
    node_id                   = "T_kwDOCLXmtc4Ag_FB"
    privacy                   = "secret"
    slug                      = "teama"
}
```

</details>

<details> <summary> github_team.teamB </summary>

```
➜  github git:(lab4) ✗ tf state show github_team.teamB
# github_team.teamB:
resource "github_team" "teamB" {
    create_default_maintainer = false
    description               = "Team B group"
    etag                      = "W/\"1f55b1c5a689d83a19d3d0705ae346bf80468224b672c6ff6a9b96bc876e46fa\""
    id                        = "8646976"
    members_count             = 0
    name                      = "teamB"
    node_id                   = "T_kwDOCLXmtc4Ag_FA"
    privacy                   = "secret"
    slug                      = "teamb"
}
```

</details>

<details> <summary> github_team_repository.teamA_repo </summary>

```
➜  github git:(lab4) ✗ tf state show github_team_repository.teamA_repo
# github_team_repository.teamA_repo:
resource "github_team_repository" "teamA_repo" {
    etag       = "W/\"576101c7e55555cc8458c632be1c5308da49b8ebeff3b81ebbdc2d59ba53f070\""
    id         = "8646977:devops-labs-tf"
    permission = "admin"
    repository = "devops-labs-tf"
    team_id    = "8646977"
}

```

</details>

<details> <summary> github_team_repository.teamB_repo </summary>

```
➜  github git:(lab4) ✗ tf state show github_team_repository.teamB_repo
# github_team_repository.teamB_repo:
resource "github_team_repository" "teamB_repo" {
    etag       = "W/\"576101c7e55555cc8458c632be1c5308da49b8ebeff3b81ebbdc2d59ba53f070\""
    id         = "8646976:devops-labs-tf"
    permission = "admin"
    repository = "devops-labs-tf"
    team_id    = "8646976"
}
```

</details>

And no outputs

</details>