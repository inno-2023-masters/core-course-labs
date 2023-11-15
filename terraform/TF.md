# Terraform

## Docker
After running `terraform apply`
```
▶terraform state list
docker_container.nginx
docker_image.nginx

▶terraform state show docker_container.nginx
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
    hostname                                    = "3eb5b6ff658e"
    id                                          = "3eb5b6ff658e76b8c83aee27f262bbb3a5cdeeb422f8a2bc878d652633521121"
    image                                       = "sha256:61395b4c586da2b9b3b7ca903ea6a448e6783dfdd7f768ff2c1a0f3360aaba99"
    init                                        = false
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "ExampleNginxContainer"
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
```
`terraform output` and `docker ps`
```
▶docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                  NAMES
3eb5b6ff658e   61395b4c586d   "/docker-entrypoint.…"   28 minutes ago   Up 28 minutes   0.0.0.0:8000->80/tcp   ExampleNginxContainer

▶terraform output
container_id = "3eb5b6ff658e76b8c83aee27f262bbb3a5cdeeb422f8a2bc878d652633521121"
image_id = "sha256:61395b4c586da2b9b3b7ca903ea6a448e6783dfdd7f768ff2c1a0f3360aaba99nginx"
```

## VK cloud

After running `terraform apply`
```
▶terraform state list
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

▶terraform state show vkcs_compute_instance.compute
# vkcs_compute_instance.compute:
resource "vkcs_compute_instance" "compute" {
    access_ip_v4        = "192.168.199.14"
    all_metadata        = {}
    all_tags            = []
    availability_zone   = "MS1"
    flavor_id           = "25ae869c-be29-4840-8e12-99e046d2dbd4"
    flavor_name         = "Basic-1-2-20"
    force_delete        = false
    id                  = "7d16b8df-aa26-4aaa-bed5-43fb4383b8b5"
    image_id            = "Attempt to boot from volume - no image supplied"
    key_pair            = "keypair-terraform"
    name                = "compute-instance"
    power_state         = "active"
    region              = "RegionOne"
    security_groups     = [
        "default",
        "security_group",
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
        fixed_ip_v4    = "192.168.199.14"
        mac            = "fa:16:3e:65:6c:7a"
        name           = "net"
        uuid           = "995cab8c-7980-4bce-ac65-5ab7b433750c"
    }
}
```

And the `terraform output` shows us the fixed ipv4 of the created instance
```
▶terraform output
instance_fip = "212.233.95.0"
```

## Github
After running `terraform apply`
```
▶terraform state list
github_branch_default.repo_default
github_branch_protection.default
github_repository.repo

▶terraform state show github_repository.repo
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
    description                 = "demo repo for devops course"
    etag                        = "W/\"2efb27845ddcd262e0de3f997a34c32b4defd1ca855657db19e81c350659c6d6\""
    full_name                   = "run4w4y/devops-course-demo"
    git_clone_url               = "git://github.com/run4w4y/devops-course-demo.git"
    has_discussions             = false
    has_downloads               = false
    has_issues                  = false
    has_projects                = false
    has_wiki                    = false
    html_url                    = "https://github.com/run4w4y/devops-course-demo"
    http_clone_url              = "https://github.com/run4w4y/devops-course-demo.git"
    id                          = "devops-course-demo"
    is_template                 = false
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "devops-course-demo"
    node_id                     = "R_kgDOKYmZQQ"
    private                     = false
    repo_id                     = 696883521
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:run4w4y/devops-course-demo.git"
    svn_url                     = "https://github.com/run4w4y/devops-course-demo"
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
```

## Terraform best practices
- separation of concerns (separate files for providers, resources, etc)
- different terraform folders for different purposes (separate folders for github, docker and cloud)
- usage of formatter and config validation (`terraform fmt` and `terraform validate`)
