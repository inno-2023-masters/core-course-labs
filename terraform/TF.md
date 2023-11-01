# Terraform

## Best Practices
- Utilized Terraform Outputs: Leveraged Terraform outputs to explicitly showcase essential information such as resource IDs, endpoints, or other important outputs. This provides clear visibility into the outputs of your infrastructure.
- Version Control for Provider Versions: pinned the versions of all providers used in Terraform configurations. This ensures stability and predictability, as newer provider versions might introduce breaking changes.
- Separated State Files from Version Control: Kept my Terraform state files separate from my version control system (git)
- Harnessed the Power of Variables: Employed variables to enhance the flexibility and maintainability of my configurations. This allows you to parameterize your Terraform code, making it easier to adapt to different environments and requirements.
- Secured Sensitive Data as Environment Variables: Protected sensitive information like Tokens by storing them as environment variables. Terraform supports referencing these variables securely in your configurations, promoting security best practices.
- Implemented .gitignore for Terraform Artifacts: Created a .gitignore file tailored for Terraform to exclude generated artifacts and sensitive files from version control. This ensures that secrets, local state files, and other Terraform-specific files are not accidentally committed.
- Naming Conventions: Followed naming conventions used within the docs of Terraform to improve code readability and maintainability.

## Docker 

### Terraform show
```hcl
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
    hostname                                    = "ea946ba1f299"
    id                                          = "ea946ba1f299d057171d8c3c497c4b1fce61f3f125ff6645cde8de42a5a1f5db"
    image                                       = "sha256:61395b4c586da2b9b3b7ca903ea6a448e6783dfdd7f768ff2c1a0f3360aaba99"
    init                                        = false
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "lab4"
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
    id           = "sha256:61395b4c586da2b9b3b7ca903ea6a448e6783dfdd7f768ff2c1a0f3360aaba99nginx"
    image_id     = "sha256:61395b4c586da2b9b3b7ca903ea6a448e6783dfdd7f768ff2c1a0f3360aaba99"
    keep_locally = false
    name         = "nginx"
    repo_digest  = "nginx@sha256:32da30332506740a2f7c34d5dc70467b7f14ec67d912703568daff790ab3f755"
}


Outputs:

container_id = "ea946ba1f299d057171d8c3c497c4b1fce61f3f125ff6645cde8de42a5a1f5db"
image_id = "sha256:61395b4c586da2b9b3b7ca903ea6a448e6783dfdd7f768ff2c1a0f3360aaba99"
```
### Terraform state list
```hcl
docker_container.nginx
docker_image.nginx
```
### Terraform output
```hcl
container_id = "ea946ba1f299d057171d8c3c497c4b1fce61f3f125ff6645cde8de42a5a1f5db"
image_id = "sha256:61395b4c586da2b9b3b7ca903ea6a448e6783dfdd7f768ff2c1a0f3360aaba99"
```

### Terraform show (after apply to change external port to 8080)
```hcl
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
    hostname                                    = "8627d45dd2d7"
    id                                          = "8627d45dd2d73fec2f04cc5c6d903e550557a396961e1d4f946170251e711716"
    image                                       = "sha256:61395b4c586da2b9b3b7ca903ea6a448e6783dfdd7f768ff2c1a0f3360aaba99"
    init                                        = false
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "lab4"
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
        external = 8080
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


Outputs:

container_id = "8627d45dd2d73fec2f04cc5c6d903e550557a396961e1d4f946170251e711716"
image_id = "sha256:61395b4c586da2b9b3b7ca903ea6a448e6783dfdd7f768ff2c1a0f3360aaba99"
```

### Terraform state list (after apply to change external port to 8080)
```hcl
docker_container.nginx
docker_image.nginx
```

### Terraform output (after apply to change external port to 8080)
```hcl
container_id = "8627d45dd2d73fec2f04cc5c6d903e550557a396961e1d4f946170251e711716"
image_id = "sha256:61395b4c586da2b9b3b7ca903ea6a448e6783dfdd7f768ff2c1a0f3360aaba99"
```

## Yandex Cloud

### Terraform show
```hcl
# yandex_compute_instance.vm:
resource "yandex_compute_instance" "vm" {
    created_at                = "2023-09-26T23:15:42Z"
    folder_id                 = "b1g33g1fgrfkjr84jeqj"
    fqdn                      = "fhmvq7qfgbhnfi6onclh.auto.internal"
    id                        = "fhmvq7qfgbhnfi6onclh"
    metadata                  = {
        "ssh-keys" = <<-EOT
            ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKIZSkL0oaxV2UCjBDZl2t+EYtfPrPS9MkNPpSKtuA0e mosab.f.r@gmail.com
        EOT
    }
    name                      = "lab4"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    status                    = "running"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhm94sd8an7c76nd6qkm"
        disk_id     = "fhm94sd8an7c76nd6qkm"
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            image_id   = "fd82sqrj4uk9j7vlki3q"
            size       = 8
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
        ip_address         = "10.128.0.31"
        ipv4               = true
        ipv6               = false
        mac_address        = "d0:0d:1f:d1:f4:f8"
        nat                = true
        nat_ip_address     = "51.250.69.25"
        nat_ip_version     = "IPV4"
        security_group_ids = []
        subnet_id          = "e9bo7uo2vcihd1n28329"
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

# yandex_vpc_network.network:
resource "yandex_vpc_network" "network" {
    created_at                = "2023-09-26T23:15:37Z"
    default_security_group_id = "enpnt6uj73fq8uu84e4q"
    folder_id                 = "b1g33g1fgrfkjr84jeqj"
    id                        = "enp2jo19de234pes7dfo"
    labels                    = {}
    subnet_ids                = []
}

# yandex_vpc_subnet.subnet:
resource "yandex_vpc_subnet" "subnet" {
    created_at     = "2023-09-26T23:15:39Z"
    folder_id      = "b1g33g1fgrfkjr84jeqj"
    id             = "e9bo7uo2vcihd1n28329"
    labels         = {}
    network_id     = "enp2jo19de234pes7dfo"
    v4_cidr_blocks = [
        "10.128.0.0/24",
    ]
    v6_cidr_blocks = []
    zone           = "ru-central1-a"
}


Outputs:

external_ip_address_vm = "51.250.69.25"
internal_ip_address_vm = "10.128.0.31"
```

### Terraform state list
```hcl
yandex_compute_instance.vm
yandex_vpc_network.network
yandex_vpc_subnet.subnet
```

### Terraform output
```hcl
external_ip_address_vm = "51.250.69.25"
internal_ip_address_vm = "10.128.0.31"
```

## Github

### Terraform show
```hcl
# github_branch_default.main:
resource "github_branch_default" "main" {
    branch     = "main"
    id         = "testing"
    repository = "testing"
}

# github_repository.testing:
resource "github_repository" "testing" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = false
    allow_squash_merge          = false
    archived                    = false
    auto_init                   = true
    branches                    = [
        {
            name      = "main"
            protected = true
        },
    ]
    default_branch              = "main"
    delete_branch_on_merge      = false
    description                 = "testing"
    etag                        = "W/\"87e0de541c383256a0f65f20ca14d7c1dd2c543f95bf6227536121c5eb8c50b8\""
    full_name                   = "IVIosab/testing"
    git_clone_url               = "git://github.com/IVIosab/testing.git"
    has_downloads               = false
    has_issues                  = true
    has_projects                = false
    has_wiki                    = true
    html_url                    = "https://github.com/IVIosab/testing"
    http_clone_url              = "https://github.com/IVIosab/testing.git"
    id                          = "testing"
    is_template                 = false
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "testing"
    node_id                     = "R_kgDOKYtfOw"
    private                     = false
    repo_id                     = 696999739
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:IVIosab/testing.git"
    svn_url                     = "https://github.com/IVIosab/testing"
    topics                      = []
    visibility                  = "public"
    vulnerability_alerts        = false
}


Outputs:

repo_full_name = "IVIosab/testing"
```

### Terraform state list

```hcl
github_branch_default.main
github_repository.testing
```


### Terraform output
repo_full_name = "IVIosab/testing"


## Github-teams

### Terraform show
```hcl
# github_repository.testing:
resource "github_repository" "testing" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = true
    allow_squash_merge          = true
    archived                    = false
    branches                    = []
    default_branch              = "main"
    delete_branch_on_merge      = false
    description                 = "testing"
    etag                        = "W/\"a83fcecb785d86413796a7507f10e9c58c37f3cb1978e400ed9d6317de5526d2\""
    full_name                   = "SecondRaccoonInaTrenchCoat/testing"
    git_clone_url               = "git://github.com/SecondRaccoonInaTrenchCoat/testing.git"
    has_downloads               = false
    has_issues                  = false
    has_projects                = false
    has_wiki                    = false
    html_url                    = "https://github.com/SecondRaccoonInaTrenchCoat/testing"
    http_clone_url              = "https://github.com/SecondRaccoonInaTrenchCoat/testing.git"
    id                          = "testing"
    is_template                 = false
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "testing"
    node_id                     = "R_kgDOKYwLnw"
    private                     = false
    repo_id                     = 697043871
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:SecondRaccoonInaTrenchCoat/testing.git"
    svn_url                     = "https://github.com/SecondRaccoonInaTrenchCoat/testing"
    visibility                  = "public"
    vulnerability_alerts        = false
}

# github_team.admins:
resource "github_team" "admins" {
    create_default_maintainer = false
    etag                      = "W/\"60ff131d3b28b9e2672852deedfe8b6c9836b780b7ec91367d3f33de23ba246e\""
    id                        = "8647416"
    members_count             = 0
    name                      = "admins"
    node_id                   = "T_kwDOCLX9As4Ag_L4"
    privacy                   = "secret"
    slug                      = "admins"
}

# github_team.devs:
resource "github_team" "devs" {
    create_default_maintainer = false
    etag                      = "W/\"f8becda24746efe25ed08a0e76776bf4351c2c6f776764c85db268be44a9c589\""
    id                        = "8647417"
    members_count             = 0
    name                      = "devs"
    node_id                   = "T_kwDOCLX9As4Ag_L5"
    privacy                   = "secret"
    slug                      = "devs"
}

# github_team.pullers:
resource "github_team" "pullers" {
    create_default_maintainer = false
    etag                      = "W/\"32faa1ad5de68cd53baa1fd7dc5f6f9288934aae1123fe97af8362fbaa7e3f41\""
    id                        = "8647418"
    members_count             = 0
    name                      = "pullers"
    node_id                   = "T_kwDOCLX9As4Ag_L6"
    privacy                   = "secret"
    slug                      = "pullers"
}

# github_team_repository.team_a_access:
resource "github_team_repository" "team_a_access" {
    etag       = "W/\"064a92b3eb2ca97fe7d8cb22bc2fb2f7d3935efe41351259208c7b6db179061f\""
    id         = "8647418:testing"
    permission = "pull"
    repository = "testing"
    team_id    = "8647418"
}

# github_team_repository.team_b_access:
resource "github_team_repository" "team_b_access" {
    etag       = "W/\"98352cf0b3b7b0fe73775dd2b0389dac1edf2128cf46a97f3a47028229cc5e47\""
    id         = "8647417:testing"
    permission = "maintain"
    repository = "testing"
    team_id    = "8647417"
}

# github_team_repository.team_c_access:
resource "github_team_repository" "team_c_access" {
    etag       = "W/\"f7c0d73f1e03b4e56a6be640264955cb177d778adc14acb7c57e0dc7fb391060\""
    id         = "8647416:testing"
    permission = "admin"
    repository = "testing"
    team_id    = "8647416"
}
```

### Terraform state list
```hcl
github_repository.testing
github_team.admins
github_team.devs
github_team.pullers
github_team_repository.team_a_access
github_team_repository.team_b_access
github_team_repository.team_c_access
```