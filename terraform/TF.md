# Terraform

## Best Practices
1. Split `main.tf` file:
    - `main.tf` - call modules, locals, and data sources to create all resources
    - `variables.tf` - contains declarations of variables used in main.tf
    - `outputs.tf` - contains outputs from the resources created in main.tf
    - `versions.tf` - contains version requirements for Terraform and providers
2. Use `terraform fmt` - rewrites Terraform configuration files to a canonical format and style
3. Use `terraform validate` -  validates the configuration files in a directory, referring only to the configuration and not accessing any remote services such as remote state, provider APIs, etc
4. Use `terraform plan` - creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure
5. Do not keep secrets in `.tf` files 

## Docker Terraform state

`terraform state show`

<details> <summary> spoiler </summary>

```
# docker_container.app_python:
resource "docker_container" "app_python" {
    attach                                      = false
    command                                     = [
        "uvicorn",
        "main:app",
        "--reload",
        "--host=0.0.0.0",
        "--port=8000",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = []
    env                                         = []
    hostname                                    = "8e2c80b8b748"
    id                                          = "8e2c80b8b748cba93ff5d0571b8bf4a5db36e2fd92bdd9e629eb5e72df51ed05"
    image                                       = "sha256:f5010a087a7e3a0fac1d278549db40670278ffb13aeed0be588c5ddbc7424f4d"
    init                                        = false
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "art22m_pyapp"
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
    user                                        = "node"
    wait                                        = false
    wait_timeout                                = 60
    working_dir                                 = "/app"

    ports {
        external = 8000
        internal = 8000
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}

# docker_image.app_python:
resource "docker_image" "app_python" {
    id           = "sha256:f5010a087a7e3a0fac1d278549db40670278ffb13aeed0be588c5ddbc7424f4dart22m/pyapp:v1"
    image_id     = "sha256:f5010a087a7e3a0fac1d278549db40670278ffb13aeed0be588c5ddbc7424f4d"
    keep_locally = false
    name         = "art22m/pyapp:v1"
    repo_digest  = "art22m/pyapp@sha256:bffe8bbdfcaf38919a5de957c974cfd287b6552c2743fe32f0c91fa88b0f8c36"
}
```

</details>

`terraform state list`

<details> <summary> spoiler </summary>

```
docker_container.app_python
docker_image.app_python
```

</details>

## Yacloud Terraform state

`terraform state show`

<details> <summary> spoiler </summary>

```
# yandex_compute_instance.compute_instance:
resource "yandex_compute_instance" "compute_instance" {
    created_at                = "2023-09-26T20:44:24Z"
    folder_id                 = "b1grfneis9t8vvbhmq35"
    fqdn                      = "epdb1ufd8p96ba93c5j9.auto.internal"
    id                        = "epdb1ufd8p96ba93c5j9"
    name                      = "tf-vm"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-b"

    boot_disk {
        auto_delete = true
        device_name = "epd67e4d4jh98ad4vf1f"
        disk_id     = "epd67e4d4jh98ad4vf1f"
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
        ip_address         = "10.129.0.21"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:b0:f9:ed:46"
        nat                = false
        security_group_ids = []
        subnet_id          = "e2l8hgnkrtrstopl441f"
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

# yandex_vpc_network.net:
resource "yandex_vpc_network" "net" {
    created_at                = "2023-09-26T20:44:21Z"
    default_security_group_id = "enpmcscc0q3n85jj7oga"
    folder_id                 = "b1grfneis9t8vvbhmq35"
    id                        = "enp4p766qeqk3iu8gmub"
    labels                    = {}
    name                      = "terraform-network"
    subnet_ids                = []
}

# yandex_vpc_subnet.subnet:
resource "yandex_vpc_subnet" "subnet" {
    created_at     = "2023-09-26T20:44:22Z"
    folder_id      = "b1grfneis9t8vvbhmq35"
    id             = "e2l8hgnkrtrstopl441f"
    labels         = {}
    name           = "terraform-network-ru-central1-b"
    network_id     = "enp4p766qeqk3iu8gmub"
    v4_cidr_blocks = [
        "10.129.0.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-b"
}
```

</details>

`terraform state list`

<details> <summary> spoiler </summary>

```
yandex_compute_instance.compute_instance
yandex_vpc_network.net
yandex_vpc_subnet.subnet
```

</details>

## Github Terraform state
`terraform state show`
<details> <summary> spoiler </summary>

```
# github_branch_default.main:
resource "github_branch_default" "main" {
    branch     = "main"
    id         = "f23-iu-devops"
    rename     = false
    repository = "f23-iu-devops"
}

# github_branch_protection.default:
resource "github_branch_protection" "default" {
    allows_deletions                = false
    allows_force_pushes             = false
    blocks_creations                = false
    enforce_admins                  = true
    id                              = "BPR_kwDOKYuL284CgWm0"
    lock_branch                     = false
    pattern                         = "main"
    repository_id                   = "f23-iu-devops"
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

# github_repository.repo:
resource "github_repository" "repo" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = true
    allow_squash_merge          = true
    allow_update_branch         = false
    archived                    = false
    auto_init                   = true
    default_branch              = "main"
    delete_branch_on_merge      = false
    description                 = "Devops course IU"
    etag                        = "W/\"ec80cd44bb458cdc620d4ceecdd482b10f64a808dbfdd7b28ee8198ee57fb049\""
    full_name                   = "iu-devops-org/f23-iu-devops"
    git_clone_url               = "git://github.com/iu-devops-org/f23-iu-devops.git"
    has_discussions             = false
    has_downloads               = false
    has_issues                  = true
    has_projects                = false
    has_wiki                    = true
    html_url                    = "https://github.com/iu-devops-org/f23-iu-devops"
    http_clone_url              = "https://github.com/iu-devops-org/f23-iu-devops.git"
    id                          = "f23-iu-devops"
    is_template                 = false
    license_template            = "mit"
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "f23-iu-devops"
    node_id                     = "R_kgDOKYuL2w"
    private                     = false
    repo_id                     = 697011163
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:iu-devops-org/f23-iu-devops.git"
    svn_url                     = "https://github.com/iu-devops-org/f23-iu-devops"
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

# github_team.team_1:
resource "github_team" "team_1" {
    create_default_maintainer = false
    description               = "first team"
    etag                      = "W/\"28938e1fa3047a0db913d38204301e147c7f258933aad88ac9c4bfb29926397a\""
    id                        = "8646988"
    members_count             = 0
    name                      = "iu-devops-1"
    node_id                   = "T_kwDOCLXm0s4Ag_FM"
    privacy                   = "secret"
    slug                      = "iu-devops-1"
}

# github_team.team_2:
resource "github_team" "team_2" {
    create_default_maintainer = false
    description               = "second team"
    etag                      = "W/\"504e0ae11a058d36e77830a622ad48c711d38fdc899dacd585f581255cd759c0\""
    id                        = "8646989"
    members_count             = 0
    name                      = "iu-devops-2"
    node_id                   = "T_kwDOCLXm0s4Ag_FN"
    privacy                   = "secret"
    slug                      = "iu-devops-2"
}

# github_team_repository.team_1_repo:
resource "github_team_repository" "team_1_repo" {
    etag       = "W/\"32dcbdd871b4ff83dc2fd699358423bce3e0a71940308facf1e8008e793f7b5b\""
    id         = "8646988:f23-iu-devops"
    permission = "maintain"
    repository = "f23-iu-devops"
    team_id    = "8646988"
}

# github_team_repository.team_2_repo:
resource "github_team_repository" "team_2_repo" {
    etag       = "W/\"63b48d3c5eabed659a296b0d133fb9eaeecc51dd774c169b6862c43b17cef859\""
    id         = "8646989:f23-iu-devops"
    permission = "admin"
    repository = "f23-iu-devops"
    team_id    = "8646989"
}
```

</details>

`terraform state list`
<details> <summary> spoiler </summary>

```
github_branch_default.main
github_branch_protection.default
github_repository.repo
github_team.team_1
github_team.team_2
github_team_repository.team_1_repo
github_team_repository.team_2_repo
```
</details>