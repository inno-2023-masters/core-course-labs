# Terraform Infrastructure

At the beginning we created the needed directory and created there 
files (required minimum files: `main.tf` and `variables.tf`).

For each of the content we apply following functions:
```
terraform init
terraform apply
```
These commands help to create the needed Terraform workspaces.

### Terraform Best Practices

* Variables and outputs are declared in another `*.tf` files
* Password and tokens are stored in secrets and not written in files 
* Using `terraform fmt` for built-in formatting
* Separate directories for each app


## Docker

<details>

* Output for `terraform state list`:
  ```
  docker_container.app_python
  docker_image.app_python
  ```

* Output for `terraform state show`
 ```
# docker_container.app_python:
resource "docker_container" "app_python" {
    attach                                      = false
    command                                     = [
        "uvicorn",
        "app.main:app",
        "--host",
        "0.0.0.0",
        "--port",
        "80",
    ]
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = []
    env                                         = []
    hostname                                    = "a14b13d6a1f7"
    id                                          = "a14b13d6a1f7485d80be41e553834419fe76b78857d4777bba50c21da7dd483b"
    image                                       = "sha256:4ce288988af94827a0ad53b21e67125454c0c752c3806ca02fdac1f4aeb0c126"
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
    user                                        = "app"
    wait                                        = false
    wait_timeout                                = 60
    working_dir                                 = "/code"

    ports {
        external = 8082
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}
  ```

  ```
  # docker_image.app_python:
  resource "docker_image" "app_python" {
      id           = "sha256:4ce288988af94827a0ad53b21e67125454c0c752c3806ca02fdac1f4aeb0c126lizavetta/devops-python:latest"
      image_id     = "sha256:4ce288988af94827a0ad53b21e67125454c0c752c3806ca02fdac1f4aeb0c126"
      keep_locally = false
      name         = "lizavetta/devops-python:latest"
      repo_digest  = "lizavetta/devops-python@sha256:5192ccf3e0c68162e57783db6ded190178bcf11046549a0ceef10d33a13ce549"
  }
  ```

* The changes applied were:
  1. Change of the ports (external: from 8000 to 8082)
  2. Adding `outputs.tf` file

* Output for `terraform output`:
  ```
  container_id = "a14b13d6a1f7485d80be41e553834419fe76b78857d4777bba50c21da7dd483b"
  image_name = "lizavetta/devops-python:latest"
  ```
  
</details>


## VK Cloud

<details>

* Output for `terraform state list`

  ```
  data.vkcs_compute_flavor.compute
  data.vkcs_images_image.compute
  data.vkcs_networking_network.extnet
  vkcs_compute_floatingip_associate.fip
  vkcs_compute_instance.compute
  vkcs_networking_floatingip.fip
  vkcs_networking_network.network
  vkcs_networking_port.port
  vkcs_networking_port_secgroup_associate.port
  vkcs_networking_router.router
  vkcs_networking_router_interface.db
  vkcs_networking_secgroup.secgroup
  vkcs_networking_secgroup_rule.secgroup_rule_1
  vkcs_networking_secgroup_rule.secgroup_rule_2
  vkcs_networking_subnet.subnetwork
  ```

* Output for `terraform state show`
 ```
  # vkcs_compute_instance.compute:
  resource "vkcs_compute_instance" "compute" {
    access_ip_v4        = "192.168.199.7"
    all_metadata        = {}
    all_tags            = []
    availability_zone   = "MS1"
    flavor_id           = "25ae869c-be29-4840-8e12-99e046d2dbd4"
    flavor_name         = "Basic-1-2-20"
    force_delete        = false
    id                  = "ddd72024-dc4c-4c1c-af5f-379fe0fdab2c"
    image_id            = "Attempt to boot from volume - no image supplied"
    name                = "compute-instance"
    power_state         = "active"
    region              = "RegionOne"
    security_groups     = [
        "default",
    ]
    stop_before_destroy = false

    block_device {
        boot_index            = 0
        delete_on_termination = true
        destination_type      = "volume"
        source_type           = "image"
        uuid                  = "b75595ca-4e1d-47e0-8e95-7a02edc0e242"
        volume_size           = 8
        volume_type           = "ceph-ssd"
    }

    network {
        access_network = false
        fixed_ip_v4    = "192.168.199.7"
        mac            = "fa:16:3e:6a:e2:a1"
        name           = "net"
        uuid           = "c779cbf8-668a-4cc0-84b9-131be1db9cc2"
    }
}
  ```
* Output for `terraform output`
  ```
  instance_fip = "87.239.108.105"
  ```
</details>



## Github Teams (with bonus tasks)

<details>

* Output for `terraform state list`:
  ```
  github_branch_default.main
  github_branch_protection.default
  github_repository.devops-course
  github_team.one
  github_team.two
  github_team_repository.team_a_to_repo
  github_team_repository.team_b_to_repo
  ```
* Output for `terraform state show`
 ```
 # github_repository.devops-course:
resource "github_repository" "devops-course" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = true
    allow_squash_merge          = true
    archived                    = false
    auto_init                   = true
    default_branch              = "main"
    delete_branch_on_merge      = false
    description                 = "My awesome course"
    etag                        = "W/\"9bb1a34eb101a1a9f954f195bb75894877e0fa7cd878c783406d03bbefa463c7\""
    full_name                   = "eliza-devops/devops-course"
    git_clone_url               = "git://github.com/eliza-devops/devops-course.git"
    has_downloads               = false
    has_issues                  = true
    has_projects                = false
    has_wiki                    = true
    html_url                    = "https://github.com/eliza-devops/devops-course"
    http_clone_url              = "https://github.com/eliza-devops/devops-course.git"
    id                          = "devops-course"
    is_template                 = false
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "devops-course"
    node_id                     = "R_kgDOKY2cVw"
    private                     = false
    repo_id                     = 697146455
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:eliza-devops/devops-course.git"
    svn_url                     = "https://github.com/eliza-devops/devops-course"
    visibility                  = "public"
    vulnerability_alerts        = false
}
 ```

  ```
  # github_branch_default.main:
  resource "github_branch_default" "main" {
      branch     = "main"
      id         = "devops-course"
      repository = "devops-course"
  }
  ```

  ``` 
  # github_team_repository.team_b_to_repo:
  resource "github_team_repository" "team_b_to_repo" {
    etag       = "W/\"5de1a0c714bb01446bce73edf9cbb3262fc85f35cafedc470e35e8cbb3f6e094\""
    id         = "8648342:devops-course"
    permission = "admin"
    repository = "devops-course"
    team_id    = "8648342"
}

  ```

</details>



