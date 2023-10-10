# terraform state list
```
docker_container.myapp_cpp
docker_container.myapp_python
docker_image.test_image_cpp
docker_image.test_image_python
```

# docker_container.myapp_cpp:
```
resource "docker_container" "myapp_cpp" {
    attach                                      = false
    command                                     = []
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    dns                                         = []
    dns_opts                                    = []
    dns_search                                  = []
    entrypoint                                  = [
        "./startServer",
        "8080",
    ]
    env                                         = []
    group_add                                   = []
    hostname                                    = "1f604bc116bf"
    id                                          = "1f604bc116bf959b2d45d3829a5b2328d3be0d892cfeeedde45e4f8b30ef5edb"
    image                                       = "sha256:9d5abf39bc2435c9c9874a14a88c7b2c7b239256f2dcf021f18daaf6481f7516"
    init                                        = false
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    log_opts                                    = {}
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "Myapp_cpp"
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
    stop_timeout                                = 0
    storage_opts                                = {}
    sysctls                                     = {}
    tmpfs                                       = {}
    tty                                         = false
    user                                        = "user_start"
    wait                                        = false
    wait_timeout                                = 60
    working_dir                                 = "/app"

    ports {
        external = 5555
        internal = 8080
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}
```
# docker_container.myapp_python:
```
resource "docker_container" "myapp_python" {
    attach                                      = false
    command                                     = []
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    dns                                         = []
    dns_opts                                    = []
    dns_search                                  = []
    entrypoint                                  = [
        "python3",
        "__init__.py",
    ]
    env                                         = []
    group_add                                   = []
    hostname                                    = "264e1f184350"
    id                                          = "264e1f1843500a506862a413936a16a6c9f2a24c5bc8ae06ca293e21179b80db"
    image                                       = "sha256:8737a99da3e34c1b56751cb8bc563061a97f448fe900cb4c804aded826064ee1"
    init                                        = false
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    log_opts                                    = {}
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "Myapp_python"
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
    user                                        = "no_root_user"
    wait                                        = false
    wait_timeout                                = 60
    working_dir                                 = "/app"

    ports {
        external = 4444
        internal = 8888
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}
```

# docker_image.test_image_cpp:
```
resource "docker_image" "test_image_cpp" {
    id           = "sha256:9d5abf39bc2435c9c9874a14a88c7b2c7b239256f2dcf021f18daaf6481f7516muurrk/myapp_cpp:latest"
    image_id     = "sha256:9d5abf39bc2435c9c9874a14a88c7b2c7b239256f2dcf021f18daaf6481f7516"
    keep_locally = false
    name         = "muurrk/myapp_cpp:latest"
    repo_digest  = "muurrk/myapp_cpp@sha256:f348b165ecd97fa875e553e268a380a5b18aea93ef8af99d423c4b911d76ced5"
}
```
# docker_image.test_image_python:
```
resource "docker_image" "test_image_python" {
    id           = "sha256:8737a99da3e34c1b56751cb8bc563061a97f448fe900cb4c804aded826064ee1muurrk/myapp:latest"
    image_id     = "sha256:8737a99da3e34c1b56751cb8bc563061a97f448fe900cb4c804aded826064ee1"
    keep_locally = false
    name         = "muurrk/myapp:latest"
    repo_digest  = "muurrk/myapp@sha256:1d124e330bb440fdf0ca23bca4cb164082102d9cad07546bac36f9fb54eebfad"
}
```

# Rename docker container
```
muurrk@muurrk-PS42-8M:~/core-course-labs/terraform$ terraform apply
docker_image.test_image_python: Refreshing state... [id=sha256:8737a99da3e34c1b56751cb8bc563061a97f448fe900cb4c804aded826064ee1muurrk/myapp:latest]
docker_image.test_image_cpp: Refreshing state... [id=sha256:9d5abf39bc2435c9c9874a14a88c7b2c7b239256f2dcf021f18daaf6481f7516muurrk/myapp_cpp:latest]
docker_container.myapp_python: Refreshing state... [id=264e1f1843500a506862a413936a16a6c9f2a24c5bc8ae06ca293e21179b80db]
docker_container.myapp_cpp: Refreshing state... [id=1f604bc116bf959b2d45d3829a5b2328d3be0d892cfeeedde45e4f8b30ef5edb]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # docker_container.myapp_cpp must be replaced
-/+ resource "docker_container" "myapp_cpp" {
      + bridge                                      = (known after apply)
      ~ command                                     = [] -> (known after apply)
      + container_logs                              = (known after apply)
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      ~ entrypoint                                  = [
          - "./startServer",
          - "8080",
        ] -> (known after apply)
      ~ env                                         = [] -> (known after apply)
      + exit_code                                   = (known after apply)
      - group_add                                   = [] -> null
      ~ hostname                                    = "1f604bc116bf" -> (known after apply)
      ~ id                                          = "1f604bc116bf959b2d45d3829a5b2328d3be0d892cfeeedde45e4f8b30ef5edb" -> (known after apply)
      ~ init                                        = false -> (known after apply)
      ~ ipc_mode                                    = "private" -> (known after apply)
      ~ log_driver                                  = "json-file" -> (known after apply)
      - log_opts                                    = {} -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
      ~ name                                        = "Myapp_cpp" -> "Myapp_cpp_NEW" # forces replacement
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
      + stop_signal                                 = (known after apply)
      ~ stop_timeout                                = 0 -> (known after apply)
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
      - user                                        = "user_start" -> null
      - working_dir                                 = "/app" -> null
        # (14 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

  # docker_container.myapp_python must be replaced
-/+ resource "docker_container" "myapp_python" {
      + bridge                                      = (known after apply)
      ~ command                                     = [] -> (known after apply)
      + container_logs                              = (known after apply)
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      ~ entrypoint                                  = [
          - "python3",
          - "__init__.py",
        ] -> (known after apply)
      ~ env                                         = [] -> (known after apply)
      + exit_code                                   = (known after apply)
      - group_add                                   = [] -> null
      ~ hostname                                    = "264e1f184350" -> (known after apply)
      ~ id                                          = "264e1f1843500a506862a413936a16a6c9f2a24c5bc8ae06ca293e21179b80db" -> (known after apply)
      ~ init                                        = false -> (known after apply)
      ~ ipc_mode                                    = "private" -> (known after apply)
      ~ log_driver                                  = "json-file" -> (known after apply)
      - log_opts                                    = {} -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
      ~ name                                        = "Myapp_python" -> "Myapp_python_NEW" # forces replacement
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
      + stop_signal                                 = (known after apply)
      ~ stop_timeout                                = 0 -> (known after apply)
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
      - user                                        = "no_root_user" -> null
      - working_dir                                 = "/app" -> null
        # (14 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

Plan: 2 to add, 0 to change, 2 to destroy.

Changes to Outputs:
  ~ cpp_container_id    = "1f604bc116bf959b2d45d3829a5b2328d3be0d892cfeeedde45e4f8b30ef5edb" -> (known after apply)
  ~ python_container_id = "264e1f1843500a506862a413936a16a6c9f2a24c5bc8ae06ca293e21179b80db" -> (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_container.myapp_cpp: Destroying... [id=1f604bc116bf959b2d45d3829a5b2328d3be0d892cfeeedde45e4f8b30ef5edb]
docker_container.myapp_python: Destroying... [id=264e1f1843500a506862a413936a16a6c9f2a24c5bc8ae06ca293e21179b80db]
docker_container.myapp_python: Destruction complete after 0s
docker_container.myapp_python: Creating...
docker_container.myapp_cpp: Destruction complete after 0s
docker_container.myapp_cpp: Creating...
docker_container.myapp_python: Creation complete after 1s [id=23b74c60be54b7c51e72aac41023afc1c35bea7c716baf937e91dd45849a8411]
docker_container.myapp_cpp: Creation complete after 1s [id=4ce8949340428091399d0d6c83b35dbb7e2ca8b5a14b551f61518784005563bb]

Apply complete! Resources: 2 added, 0 changed, 2 destroyed.

Outputs:

cpp_container_id = "4ce8949340428091399d0d6c83b35dbb7e2ca8b5a14b551f61518784005563bb"
python_container_id = "23b74c60be54b7c51e72aac41023afc1c35bea7c716baf937e91dd45849a8411"
```

# terraform output
```
cpp_container_id = "4ce8949340428091399d0d6c83b35dbb7e2ca8b5a14b551f61518784005563bb"
python_container_id = "23b74c60be54b7c51e72aac41023afc1c35bea7c716baf937e91dd45849a8411"
```

# VK cloud:
```
muurrk@muurrk-PS42-8M:~/core-course-labs/terraform$ terraform apply
docker_image.test_image_python: Refreshing state... [id=sha256:8737a99da3e34c1b56751cb8bc563061a97f448fe900cb4c804aded826064ee1muurrk/myapp:latest]
module.cloud.data.vkcs_networking_network.extnet: Reading...
module.cloud.data.vkcs_compute_flavor.compute: Reading...
module.cloud.data.vkcs_images_image.compute: Reading...
module.cloud.data.vkcs_images_image.compute: Read complete after 0s [id=b75595ca-4e1d-47e0-8e95-7a02edc0e242]
module.cloud.data.vkcs_compute_flavor.compute: Read complete after 0s [id=25ae869c-be29-4840-8e12-99e046d2dbd4]
module.cloud.data.vkcs_networking_network.extnet: Read complete after 1s [id=298117ae-3fa4-4109-9e08-8be5602be5a2]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # docker_container.myapp_cpp will be created
  + resource "docker_container" "myapp_cpp" {
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
      + name                                        = "Myapp_cpp_NEW"
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
          + external = 5555
          + internal = 8080
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # docker_container.myapp_python will be created
  + resource "docker_container" "myapp_python" {
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
      + image                                       = "sha256:8737a99da3e34c1b56751cb8bc563061a97f448fe900cb4c804aded826064ee1"
      + init                                        = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "Myapp_python_NEW"
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
          + external = 4444
          + internal = 8888
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # docker_image.test_image_cpp will be created
  + resource "docker_image" "test_image_cpp" {
      + id           = (known after apply)
      + image_id     = (known after apply)
      + keep_locally = false
      + name         = "muurrk/myapp_cpp:latest"
      + repo_digest  = (known after apply)
    }

  # module.cloud.vkcs_compute_floatingip_associate.fip will be created
  + resource "vkcs_compute_floatingip_associate" "fip" {
      + floating_ip = (known after apply)
      + id          = (known after apply)
      + instance_id = (known after apply)
      + region      = (known after apply)
    }

  # module.cloud.vkcs_compute_instance.compute will be created
  + resource "vkcs_compute_instance" "compute" {
      + access_ip_v4        = (known after apply)
      + all_metadata        = (known after apply)
      + all_tags            = (known after apply)
      + availability_zone   = "MS1"
      + flavor_id           = "25ae869c-be29-4840-8e12-99e046d2dbd4"
      + flavor_name         = (known after apply)
      + force_delete        = false
      + id                  = (known after apply)
      + image_id            = (known after apply)
      + image_name          = (known after apply)
      + key_pair            = "DevOpsLab"
      + name                = "compute-instance"
      + power_state         = "active"
      + region              = (known after apply)
      + security_groups     = (known after apply)
      + stop_before_destroy = false

      + block_device {
          + boot_index            = 0
          + delete_on_termination = true
          + destination_type      = "volume"
          + source_type           = "image"
          + uuid                  = "b75595ca-4e1d-47e0-8e95-7a02edc0e242"
          + volume_size           = 8
          + volume_type           = "ceph-ssd"
        }

      + network {
          + access_network = false
          + fixed_ip_v4    = (known after apply)
          + mac            = (known after apply)
          + name           = (known after apply)
          + port           = (known after apply)
          + uuid           = (known after apply)
        }
    }

  # module.cloud.vkcs_networking_floatingip.fip will be created
  + resource "vkcs_networking_floatingip" "fip" {
      + address   = (known after apply)
      + fixed_ip  = (known after apply)
      + id        = (known after apply)
      + pool      = "ext-net"
      + port_id   = (known after apply)
      + region    = (known after apply)
      + sdn       = (known after apply)
      + subnet_id = (known after apply)
    }

  # module.cloud.vkcs_networking_network.network will be created
  + resource "vkcs_networking_network" "network" {
      + admin_state_up        = true
      + all_tags              = (known after apply)
      + id                    = (known after apply)
      + name                  = "net"
      + port_security_enabled = true
      + private_dns_domain    = (known after apply)
      + region                = (known after apply)
      + sdn                   = (known after apply)
    }

  # module.cloud.vkcs_networking_port.port will be created
  + resource "vkcs_networking_port" "port" {
      + admin_state_up         = true
      + all_fixed_ips          = (known after apply)
      + all_security_group_ids = (known after apply)
      + all_tags               = (known after apply)
      + device_id              = (known after apply)
      + device_owner           = (known after apply)
      + dns_assignment         = (known after apply)
      + dns_name               = (known after apply)
      + id                     = (known after apply)
      + mac_address            = (known after apply)
      + name                   = "port_1"
      + network_id             = (known after apply)
      + port_security_enabled  = true
      + region                 = (known after apply)
      + sdn                    = (known after apply)

      + fixed_ip {
          + ip_address = "192.168.199.23"
          + subnet_id  = (known after apply)
        }
    }

  # module.cloud.vkcs_networking_port_secgroup_associate.port will be created
  + resource "vkcs_networking_port_secgroup_associate" "port" {
      + all_security_group_ids = (known after apply)
      + enforce                = false
      + id                     = (known after apply)
      + port_id                = (known after apply)
      + region                 = (known after apply)
      + sdn                    = (known after apply)
      + security_group_ids     = (known after apply)
    }

  # module.cloud.vkcs_networking_router.router will be created
  + resource "vkcs_networking_router" "router" {
      + admin_state_up      = true
      + all_tags            = (known after apply)
      + external_network_id = "298117ae-3fa4-4109-9e08-8be5602be5a2"
      + id                  = (known after apply)
      + name                = "router"
      + region              = (known after apply)
      + sdn                 = (known after apply)
    }

  # module.cloud.vkcs_networking_router_interface.db will be created
  + resource "vkcs_networking_router_interface" "db" {
      + id        = (known after apply)
      + port_id   = (known after apply)
      + region    = (known after apply)
      + router_id = (known after apply)
      + sdn       = (known after apply)
      + subnet_id = (known after apply)
    }

  # module.cloud.vkcs_networking_secgroup.secgroup will be created
  + resource "vkcs_networking_secgroup" "secgroup" {
      + all_tags    = (known after apply)
      + description = "terraform security group"
      + id          = (known after apply)
      + name        = "security_group"
      + region      = (known after apply)
      + sdn         = (known after apply)
    }

  # module.cloud.vkcs_networking_secgroup_rule.secgroup_rule_1 will be created
  + resource "vkcs_networking_secgroup_rule" "secgroup_rule_1" {
      + description       = "secgroup_rule_1"
      + direction         = "ingress"
      + ethertype         = "IPv4"
      + id                = (known after apply)
      + port_range_max    = 22
      + port_range_min    = 22
      + protocol          = "tcp"
      + region            = (known after apply)
      + remote_group_id   = (known after apply)
      + remote_ip_prefix  = "0.0.0.0/0"
      + sdn               = (known after apply)
      + security_group_id = (known after apply)
    }

  # module.cloud.vkcs_networking_secgroup_rule.secgroup_rule_2 will be created
  + resource "vkcs_networking_secgroup_rule" "secgroup_rule_2" {
      + direction         = "ingress"
      + ethertype         = "IPv4"
      + id                = (known after apply)
      + port_range_max    = 3389
      + port_range_min    = 3389
      + protocol          = "tcp"
      + region            = (known after apply)
      + remote_group_id   = (known after apply)
      + remote_ip_prefix  = "0.0.0.0/0"
      + sdn               = (known after apply)
      + security_group_id = (known after apply)
    }

  # module.cloud.vkcs_networking_subnet.subnetwork will be created
  + resource "vkcs_networking_subnet" "subnetwork" {
      + all_tags    = (known after apply)
      + cidr        = "192.168.199.0/24"
      + enable_dhcp = true
      + gateway_ip  = (known after apply)
      + id          = (known after apply)
      + name        = "subnet_1"
      + network_id  = (known after apply)
      + no_gateway  = false
      + region      = (known after apply)
      + sdn         = (known after apply)
    }

Plan: 15 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + cpp_container_id    = (known after apply)
  + python_container_id = (known after apply)
╷
│ Warning: Argument is deprecated
│ 
│   with module.cloud.vkcs_networking_secgroup_rule.secgroup_rule_1,
│   on cloud/network.tf line 34, in resource "vkcs_networking_secgroup_rule" "secgroup_rule_1":
│   34:    ethertype = "IPv4"
│ 
│ Only IPv4 can be used as ethertype. This argument is deprecated, please do not use it.
│ 
│ (and 3 more similar warnings elsewhere)
╵

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_image.test_image_cpp: Creating...
docker_container.myapp_python: Creating...
module.cloud.vkcs_networking_secgroup.secgroup: Creating...
module.cloud.vkcs_networking_network.network: Creating...
module.cloud.vkcs_networking_router.router: Creating...
module.cloud.vkcs_networking_floatingip.fip: Creating...
docker_container.myapp_python: Creation complete after 1s [id=222f8cb81b9ed57a31693867e34b1c7e6541f357ed805c3e11dceb64f7a5b267]
module.cloud.vkcs_networking_secgroup.secgroup: Creation complete after 1s [id=90da111b-c36d-416e-b7d8-1ee84cb6dc23]
module.cloud.vkcs_networking_secgroup_rule.secgroup_rule_2: Creating...
module.cloud.vkcs_networking_secgroup_rule.secgroup_rule_1: Creating...
module.cloud.vkcs_networking_secgroup_rule.secgroup_rule_2: Creation complete after 3s [id=fb7daf7e-051c-4289-9b78-976a2879d675]
docker_image.test_image_cpp: Creation complete after 5s [id=sha256:9d5abf39bc2435c9c9874a14a88c7b2c7b239256f2dcf021f18daaf6481f7516muurrk/myapp_cpp:latest]
docker_container.myapp_cpp: Creating...
docker_container.myapp_cpp: Creation complete after 1s [id=bd7902ac2fa34d8d57e4204f180ebdb6cede76a1d301ebdbf17dbe8340545e2a]
module.cloud.vkcs_networking_secgroup_rule.secgroup_rule_1: Creation complete after 5s [id=740fc541-3e66-429c-ae76-23d00d137f96]
module.cloud.vkcs_networking_network.network: Creation complete after 6s [id=784e9d5e-a5a6-4df8-aad4-afb4d965d32f]
module.cloud.vkcs_networking_subnet.subnetwork: Creating...
module.cloud.vkcs_networking_router.router: Still creating... [10s elapsed]
module.cloud.vkcs_networking_floatingip.fip: Still creating... [10s elapsed]
module.cloud.vkcs_networking_subnet.subnetwork: Creation complete after 7s [id=2b1254e3-47b6-4eb6-85e9-200612fb8467]
module.cloud.vkcs_networking_port.port: Creating...
module.cloud.vkcs_compute_instance.compute: Creating...
module.cloud.vkcs_networking_floatingip.fip: Creation complete after 15s [id=ce7f43e7-187d-47fe-ae65-029624e08d5a]
module.cloud.vkcs_networking_port.port: Creation complete after 6s [id=eb499dcb-1924-4381-a6cf-69de75112863]
module.cloud.vkcs_networking_port_secgroup_associate.port: Creating...
module.cloud.vkcs_networking_router.router: Still creating... [20s elapsed]
module.cloud.vkcs_networking_port_secgroup_associate.port: Creation complete after 2s [id=eb499dcb-1924-4381-a6cf-69de75112863]
module.cloud.vkcs_compute_instance.compute: Still creating... [10s elapsed]
module.cloud.vkcs_networking_router.router: Creation complete after 25s [id=81951c18-e6f6-45d5-a8b9-ec4a6e91c24b]
module.cloud.vkcs_networking_router_interface.db: Creating...
module.cloud.vkcs_compute_instance.compute: Still creating... [20s elapsed]
module.cloud.vkcs_networking_router_interface.db: Still creating... [10s elapsed]
module.cloud.vkcs_networking_router_interface.db: Creation complete after 10s [id=96d9afe8-fe59-43b0-a7b3-d5a557bbab95]
module.cloud.vkcs_compute_instance.compute: Still creating... [30s elapsed]
module.cloud.vkcs_compute_instance.compute: Still creating... [40s elapsed]
module.cloud.vkcs_compute_instance.compute: Creation complete after 46s [id=f970378d-526a-4d0e-87f4-129a0c14ceac]
module.cloud.vkcs_compute_floatingip_associate.fip: Creating...
module.cloud.vkcs_compute_floatingip_associate.fip: Creation complete after 6s [id=89.208.228.192/f970378d-526a-4d0e-87f4-129a0c14ceac/]
╷
│ Warning: Argument is deprecated
│ 
│   with module.cloud.vkcs_networking_secgroup_rule.secgroup_rule_1,
│   on cloud/network.tf line 34, in resource "vkcs_networking_secgroup_rule" "secgroup_rule_1":
│   34:    ethertype = "IPv4"
│ 
│ Only IPv4 can be used as ethertype. This argument is deprecated, please do not use it.
│ 
│ (and one more similar warning elsewhere)
╵

Apply complete! Resources: 15 added, 0 changed, 0 destroyed.

Outputs:

cpp_container_id = "bd7902ac2fa34d8d57e4204f180ebdb6cede76a1d301ebdbf17dbe8340545e2a"
python_container_id = "222f8cb81b9ed57a31693867e34b1c7e6541f357ed805c3e11dceb64f7a5b267"
```

# Github
```
muurrk@muurrk-PS42-8M:~/core-course-labs/terraform$ terraform apply
docker_image.test_image_python: Refreshing state... [id=sha256:8737a99da3e34c1b56751cb8bc563061a97f448fe900cb4c804aded826064ee1muurrk/myapp:latest]
docker_image.test_image_cpp: Refreshing state... [id=sha256:9d5abf39bc2435c9c9874a14a88c7b2c7b239256f2dcf021f18daaf6481f7516muurrk/myapp_cpp:latest]
docker_container.myapp_cpp: Refreshing state... [id=56541618e3642a36a36411d24565aff42a474c04fd4b4a76c9916733d24db5f0]
docker_container.myapp_python: Refreshing state... [id=ba04dfc18c9e98a458a5181f634a109aea488447f84317988d179df408888cca]
module.cloud.data.vkcs_networking_network.extnet: Reading...
module.cloud.vkcs_networking_secgroup.secgroup: Refreshing state... [id=63203687-0c21-4fb8-9174-4b28a5137393]
module.cloud.data.vkcs_compute_flavor.compute: Reading...
module.cloud.data.vkcs_images_image.compute: Reading...
module.cloud.vkcs_networking_network.network: Refreshing state... [id=e7987713-a911-4faf-9fd4-95e898595627]
module.cloud.vkcs_networking_secgroup_rule.secgroup_rule_2: Refreshing state... [id=f0c6910d-de3e-429b-9314-54650096df44]
module.cloud.vkcs_networking_secgroup_rule.secgroup_rule_1: Refreshing state... [id=f9ecbf63-fe34-4287-8259-76d12b41a2ec]
module.cloud.data.vkcs_images_image.compute: Read complete after 1s [id=b75595ca-4e1d-47e0-8e95-7a02edc0e242]
module.cloud.data.vkcs_compute_flavor.compute: Read complete after 1s [id=25ae869c-be29-4840-8e12-99e046d2dbd4]
module.cloud.vkcs_networking_subnet.subnetwork: Refreshing state... [id=f280525d-c313-4617-abc6-0bccadf87cf8]
module.cloud.vkcs_networking_port.port: Refreshing state... [id=a0f91b53-5b79-476f-a78f-1afa92e3ea39]
module.cloud.vkcs_compute_instance.compute: Refreshing state... [id=8a183fc3-d970-4fac-8c38-9b2d8d1b57cf]
module.cloud.data.vkcs_networking_network.extnet: Read complete after 1s [id=298117ae-3fa4-4109-9e08-8be5602be5a2]
module.cloud.vkcs_networking_floatingip.fip: Refreshing state... [id=56c2f5b8-1f5a-4ff2-8646-6e79d452c6e9]
module.cloud.vkcs_networking_router.router: Refreshing state... [id=172e054c-8997-4706-af08-b8beb0344404]
module.cloud.vkcs_networking_port_secgroup_associate.port: Refreshing state... [id=a0f91b53-5b79-476f-a78f-1afa92e3ea39]
module.cloud.vkcs_networking_router_interface.db: Refreshing state... [id=9a34ad3e-6e72-4115-916d-757175ab8526]
module.cloud.vkcs_compute_floatingip_associate.fip: Refreshing state... [id=84.23.53.114/8a183fc3-d970-4fac-8c38-9b2d8d1b57cf/]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # module.github.github_branch_default.core_main will be created
  + resource "github_branch_default" "core_main" {
      + branch     = "main"
      + id         = (known after apply)
      + repository = "test_devops"
    }

  # module.github.github_branch_default.main will be created
  + resource "github_branch_default" "main" {
      + branch     = "main"
      + id         = (known after apply)
      + repository = "test_repo"
    }

  # module.github.github_branch_protection.default will be created
  + resource "github_branch_protection" "default" {
      + allows_deletions                = false
      + allows_force_pushes             = false
      + blocks_creations                = false
      + enforce_admins                  = true
      + id                              = (known after apply)
      + pattern                         = "main"
      + repository_id                   = (known after apply)
      + require_conversation_resolution = true
      + require_signed_commits          = false
      + required_linear_history         = false
    }

  # module.github.github_repository.core will be created
  + resource "github_repository" "core" {
      + allow_auto_merge            = false
      + allow_merge_commit          = true
      + allow_rebase_merge          = true
      + allow_squash_merge          = true
      + archived                    = false
      + auto_init                   = true
      + default_branch              = (known after apply)
      + delete_branch_on_merge      = false
      + description                 = "Innopolis DevOps 2023 core repository"
      + etag                        = (known after apply)
      + full_name                   = (known after apply)
      + git_clone_url               = (known after apply)
      + html_url                    = (known after apply)
      + http_clone_url              = (known after apply)
      + id                          = (known after apply)
      + merge_commit_message        = "PR_TITLE"
      + merge_commit_title          = "MERGE_MESSAGE"
      + name                        = "test_devops"
      + node_id                     = (known after apply)
      + private                     = (known after apply)
      + repo_id                     = (known after apply)
      + squash_merge_commit_message = "COMMIT_MESSAGES"
      + squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
      + ssh_clone_url               = (known after apply)
      + svn_url                     = (known after apply)
      + visibility                  = "public"
    }

  # module.github.github_repository.repo will be created
  + resource "github_repository" "repo" {
      + allow_auto_merge            = false
      + allow_merge_commit          = true
      + allow_rebase_merge          = false
      + allow_squash_merge          = false
      + archived                    = false
      + auto_init                   = true
      + default_branch              = (known after apply)
      + delete_branch_on_merge      = false
      + description                 = "test_repo"
      + etag                        = (known after apply)
      + full_name                   = (known after apply)
      + git_clone_url               = (known after apply)
      + has_issues                  = true
      + has_wiki                    = true
      + html_url                    = (known after apply)
      + http_clone_url              = (known after apply)
      + id                          = (known after apply)
      + merge_commit_message        = "PR_TITLE"
      + merge_commit_title          = "MERGE_MESSAGE"
      + name                        = "test_repo"
      + node_id                     = (known after apply)
      + private                     = (known after apply)
      + repo_id                     = (known after apply)
      + squash_merge_commit_message = "COMMIT_MESSAGES"
      + squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
      + ssh_clone_url               = (known after apply)
      + svn_url                     = (known after apply)
      + visibility                  = "public"
    }

Plan: 5 to add, 0 to change, 0 to destroy.
╷
│ Warning: Argument is deprecated
│ 
│   with module.cloud.vkcs_networking_secgroup_rule.secgroup_rule_1,
│   on cloud/network.tf line 34, in resource "vkcs_networking_secgroup_rule" "secgroup_rule_1":
│   34:    ethertype = "IPv4"
│ 
│ Only IPv4 can be used as ethertype. This argument is deprecated, please do not use it.
│ 
│ (and 3 more similar warnings elsewhere)
╵

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.github.github_repository.core: Creating...
module.github.github_repository.repo: Creating...
module.github.github_repository.core: Still creating... [10s elapsed]
module.github.github_repository.repo: Still creating... [10s elapsed]
module.github.github_repository.core: Creation complete after 11s [id=test_devops]
module.github.github_branch_default.core_main: Creating...
module.github.github_repository.repo: Creation complete after 11s [id=test_repo]
module.github.github_branch_default.main: Creating...
module.github.github_branch_default.core_main: Creation complete after 3s [id=test_devops]
module.github.github_branch_default.main: Creation complete after 4s [id=test_repo]
module.github.github_branch_protection.default: Creating...
module.github.github_branch_protection.default: Creation complete after 4s [id=BPR_kwDOKY2Y684CgZ4_]

Apply complete! Resources: 5 added, 0 changed, 0 destroyed.

Outputs:

cpp_container_id = "56541618e3642a36a36411d24565aff42a474c04fd4b4a76c9916733d24db5f0"
python_container_id = "ba04dfc18c9e98a458a5181f634a109aea488447f84317988d179df408888cca"
```

```
muurrk@muurrk-PS42-8M:~/core-course-labs/terraform$ terraform state list
docker_container.myapp_cpp
docker_container.myapp_python
docker_image.test_image_cpp
docker_image.test_image_python
module.cloud.data.vkcs_compute_flavor.compute
module.cloud.data.vkcs_images_image.compute
module.cloud.data.vkcs_networking_network.extnet
module.cloud.vkcs_compute_floatingip_associate.fip
module.cloud.vkcs_compute_instance.compute
module.cloud.vkcs_networking_floatingip.fip
module.cloud.vkcs_networking_network.network
module.cloud.vkcs_networking_port.port
module.cloud.vkcs_networking_port_secgroup_associate.port
module.cloud.vkcs_networking_router.router
module.cloud.vkcs_networking_router_interface.db
module.cloud.vkcs_networking_secgroup.secgroup
module.cloud.vkcs_networking_secgroup_rule.secgroup_rule_1
module.cloud.vkcs_networking_secgroup_rule.secgroup_rule_2
module.cloud.vkcs_networking_subnet.subnetwork
module.github.github_branch_default.core_main
module.github.github_branch_default.main
module.github.github_branch_protection.default
module.github.github_repository.core
module.github.github_repository.repo
muurrk@muurrk-PS42-8M:~/core-course-labs/terraform$ terraform state show module.github.github_branch_default.core_main
# module.github.github_branch_default.core_main:
resource "github_branch_default" "core_main" {
    branch     = "main"
    id         = "test_devops"
    repository = "test_devops"
}
muurrk@muurrk-PS42-8M:~/core-course-labs/terraform$ terraform state show module.github.github_branch_default.main
# module.github.github_branch_default.main:
resource "github_branch_default" "main" {
    branch     = "main"
    id         = "test_repo"
    repository = "test_repo"
}
muurrk@muurrk-PS42-8M:~/core-course-labs/terraform$ terraform state show module.github.github_repository.core
# module.github.github_repository.core:
resource "github_repository" "core" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = true
    allow_squash_merge          = true
    archived                    = false
    auto_init                   = true
    default_branch              = "main"
    delete_branch_on_merge      = false
    description                 = "Innopolis DevOps 2023 core repository"
    etag                        = "W/\"ff5b0ddf1ebe2498ac0303448926ecbbcee0c943d017fc2b8b2633d1e392d0e2\""
    full_name                   = "Markuu-s/test_devops"
    git_clone_url               = "git://github.com/Markuu-s/test_devops.git"
    has_downloads               = false
    has_issues                  = false
    has_projects                = false
    has_wiki                    = false
    html_url                    = "https://github.com/Markuu-s/test_devops"
    http_clone_url              = "https://github.com/Markuu-s/test_devops.git"
    id                          = "test_devops"
    is_template                 = false
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "test_devops"
    node_id                     = "R_kgDOKY2Y0g"
    private                     = false
    repo_id                     = 697145554
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:Markuu-s/test_devops.git"
    svn_url                     = "https://github.com/Markuu-s/test_devops"
    visibility                  = "public"
    vulnerability_alerts        = false
}
muurrk@muurrk-PS42-8M:~/core-course-labs/terraform$ terraform state show module.github.github_repository.repo
# module.github.github_repository.repo:
resource "github_repository" "repo" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = false
    allow_squash_merge          = false
    archived                    = false
    auto_init                   = true
    default_branch              = "main"
    delete_branch_on_merge      = false
    description                 = "test_repo"
    etag                        = "W/\"8475147e48a605a6eb43900abb1d91d2275bf86f7736c4410decd3cec1a53fa7\""
    full_name                   = "Markuu-s/test_repo"
    git_clone_url               = "git://github.com/Markuu-s/test_repo.git"
    has_downloads               = false
    has_issues                  = true
    has_projects                = false
    has_wiki                    = true
    html_url                    = "https://github.com/Markuu-s/test_repo"
    http_clone_url              = "https://github.com/Markuu-s/test_repo.git"
    id                          = "test_repo"
    is_template                 = false
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "test_repo"
    node_id                     = "R_kgDOKY2Y6w"
    private                     = false
    repo_id                     = 697145579
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:Markuu-s/test_repo.git"
    svn_url                     = "https://github.com/Markuu-s/test_repo"
    visibility                  = "public"
    vulnerability_alerts        = false
}
muurrk@muurrk-PS42-8M:~/core-course-labs/terraform$ 
```

# Test import
```
github_repository.core: Refreshing state... [id=core-test-import]
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
  ~ update in-place
Terraform will perform the following actions:
  # github_branch_default.core_main will be created
  + resource "github_branch_default" "repo" {
      + branch     = "main"
      + id         = (known after apply)
      + rename     = false
      + repository = "test_repo"
    }
  # github_branch_default.main will be created
  + resource "github_branch_default" "main" {
      + branch     = "main"
      + id         = (known after apply)
      + rename     = false
      + repository = "test_repo"
    }
  # github_branch_protection.default will be created
  + resource "github_branch_protection" "default" {
      + allows_deletions                = false
      + allows_force_pushes             = false
      + blocks_creations                = false
      + enforce_admins                  = true
      + id                              = (known after apply)
      + lock_branch                     = false
      + pattern                         = "main"
      + repository_id                   = (known after apply)
      + require_conversation_resolution = true
      + require_signed_commits          = false
      + required_linear_history         = false
    }
  # github_repository.core will be updated in-place
  ~ resource "github_repository" "core" {
      ~ auto_init                   = false -> true
      + description                 = "Innopolis DevOps"
      ~ full_name                   = "Markuu-s/core-test-import" -> (known after apply)
      - has_downloads               = true -> null
      - has_issues                  = true -> null
      - has_projects                = true -> null
      - has_wiki                    = true -> null
        id                          = "core-test-import"
      ~ name                        = "core-test-import" -> "test_devops"
        # (26 unchanged attributes hidden)
        # (1 unchanged block hidden)
    }
  # github_repository.repo will be created
  + resource "github_repository" "repo" {
      + allow_auto_merge            = false
      + allow_merge_commit          = true
      + allow_rebase_merge          = false
      + allow_squash_merge          = false
      + archived                    = false
      + auto_init                   = true
      + default_branch              = (known after apply)
      + delete_branch_on_merge      = false
      + description                 = "Devops_repo"
      + etag                        = (known after apply)
      + full_name                   = (known after apply)
      + git_clone_url               = (known after apply)
      + has_issues                  = true
      + has_wiki                    = true
      + html_url                    = (known after apply)
      + http_clone_url              = (known after apply)
      + id                          = (known after apply)
      + merge_commit_message        = "PR_TITLE"
      + merge_commit_title          = "MERGE_MESSAGE"
      + name                        = "Devops_repo"
      + node_id                     = (known after apply)
      + primary_language            = (known after apply)
      + private                     = (known after apply)
      + repo_id                     = (known after apply)
      + squash_merge_commit_message = "COMMIT_MESSAGES"
      + squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
      + ssh_clone_url               = (known after apply)
      + svn_url                     = (known after apply)
      + topics                      = (known after apply)
      + visibility                  = "public"
    }
Plan: 4 to add, 1 to change, 0 to destroy.
Changes to Outputs:
  + repo_name = (known after apply)
```

```

# Github Teams
```
muurrk@muurrk-PS42-8M:~/core-course-labs/terraform$ terraform apply
docker_image.test_image_cpp: Refreshing state... [id=sha256:9d5abf39bc2435c9c9874a14a88c7b2c7b239256f2dcf021f18daaf6481f7516muurrk/myapp_cpp:latest]
docker_image.test_image_python: Refreshing state... [id=sha256:8737a99da3e34c1b56751cb8bc563061a97f448fe900cb4c804aded826064ee1muurrk/myapp:latest]
docker_container.myapp_cpp: Refreshing state... [id=56541618e3642a36a36411d24565aff42a474c04fd4b4a76c9916733d24db5f0]
docker_container.myapp_python: Refreshing state... [id=ba04dfc18c9e98a458a5181f634a109aea488447f84317988d179df408888cca]
module.cloud.data.vkcs_compute_flavor.compute: Reading...
module.cloud.vkcs_networking_secgroup.secgroup: Refreshing state... [id=63203687-0c21-4fb8-9174-4b28a5137393]
module.cloud.data.vkcs_images_image.compute: Reading...
module.cloud.vkcs_networking_network.network: Refreshing state... [id=e7987713-a911-4faf-9fd4-95e898595627]
module.cloud.data.vkcs_networking_network.extnet: Reading...
module.github.github_branch_default.core_main: Refreshing state... [id=test_devops]
module.github.github_branch_protection.default: Refreshing state... [id=BPR_kwDOKY2Y684CgZ4_]
module.github.github_repository.repo: Refreshing state... [id=test_repo]
module.github.github_repository.core: Refreshing state... [id=test_devops]
module.github.github_branch_default.main: Refreshing state... [id=test_repo]
module.cloud.data.vkcs_images_image.compute: Read complete after 0s [id=b75595ca-4e1d-47e0-8e95-7a02edc0e242]
module.cloud.data.vkcs_compute_flavor.compute: Read complete after 0s [id=25ae869c-be29-4840-8e12-99e046d2dbd4]
module.cloud.vkcs_networking_secgroup_rule.secgroup_rule_1: Refreshing state... [id=f9ecbf63-fe34-4287-8259-76d12b41a2ec]
module.cloud.vkcs_networking_secgroup_rule.secgroup_rule_2: Refreshing state... [id=f0c6910d-de3e-429b-9314-54650096df44]
module.cloud.vkcs_networking_subnet.subnetwork: Refreshing state... [id=f280525d-c313-4617-abc6-0bccadf87cf8]
module.cloud.data.vkcs_networking_network.extnet: Read complete after 1s [id=298117ae-3fa4-4109-9e08-8be5602be5a2]
module.cloud.vkcs_networking_floatingip.fip: Refreshing state... [id=56c2f5b8-1f5a-4ff2-8646-6e79d452c6e9]
module.cloud.vkcs_networking_router.router: Refreshing state... [id=172e054c-8997-4706-af08-b8beb0344404]
module.cloud.vkcs_networking_port.port: Refreshing state... [id=a0f91b53-5b79-476f-a78f-1afa92e3ea39]
module.cloud.vkcs_compute_instance.compute: Refreshing state... [id=8a183fc3-d970-4fac-8c38-9b2d8d1b57cf]
module.cloud.vkcs_networking_port_secgroup_associate.port: Refreshing state... [id=a0f91b53-5b79-476f-a78f-1afa92e3ea39]
module.cloud.vkcs_networking_router_interface.db: Refreshing state... [id=9a34ad3e-6e72-4115-916d-757175ab8526]
module.cloud.vkcs_compute_floatingip_associate.fip: Refreshing state... [id=84.23.53.114/8a183fc3-d970-4fac-8c38-9b2d8d1b57cf/]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create
  - destroy

Terraform will perform the following actions:

  # module.github.github_branch_default.core_main will be destroyed
  # (because github_branch_default.core_main is not in configuration)
  - resource "github_branch_default" "core_main" {
      - branch     = "main" -> null
      - id         = "test_devops" -> null
      - repository = "test_devops" -> null
    }

  # module.github.github_branch_default.main will be destroyed
  # (because github_branch_default.main is not in configuration)
  - resource "github_branch_default" "main" {
      - branch     = "main" -> null
      - id         = "test_repo" -> null
      - repository = "test_repo" -> null
    }

  # module.github.github_branch_protection.default will be destroyed
  # (because github_branch_protection.default is not in configuration)
  - resource "github_branch_protection" "default" {
      - allows_deletions                = false -> null
      - allows_force_pushes             = false -> null
      - blocks_creations                = false -> null
      - enforce_admins                  = true -> null
      - id                              = "BPR_kwDOKY2Y684CgZ4_" -> null
      - pattern                         = "main" -> null
      - push_restrictions               = [] -> null
      - repository_id                   = "test_repo" -> null
      - require_conversation_resolution = true -> null
      - require_signed_commits          = false -> null
      - required_linear_history         = false -> null
    }

  # module.github.github_repository.core will be destroyed
  # (because github_repository.core is not in configuration)
  - resource "github_repository" "core" {
      - allow_auto_merge            = false -> null
      - allow_merge_commit          = true -> null
      - allow_rebase_merge          = true -> null
      - allow_squash_merge          = true -> null
      - archived                    = false -> null
      - auto_init                   = true -> null
      - default_branch              = "main" -> null
      - delete_branch_on_merge      = false -> null
      - etag                        = "W/\"e07b00e0e8a6a494ecddf50a5ad4d5a1834a52da229290a4b8d3a01c37aa4835\"" -> null
      - full_name                   = "DevOpsTestMuurrk/test_devops" -> null
      - git_clone_url               = "git://github.com/DevOpsTestMuurrk/test_devops.git" -> null
      - has_downloads               = true -> null
      - has_issues                  = true -> null
      - has_projects                = true -> null
      - has_wiki                    = true -> null
      - html_url                    = "https://github.com/DevOpsTestMuurrk/test_devops" -> null
      - http_clone_url              = "https://github.com/DevOpsTestMuurrk/test_devops.git" -> null
      - id                          = "test_devops" -> null
      - is_template                 = false -> null
      - merge_commit_message        = "PR_TITLE" -> null
      - merge_commit_title          = "MERGE_MESSAGE" -> null
      - name                        = "test_devops" -> null
      - node_id                     = "R_kgDOKY2_Yg" -> null
      - private                     = false -> null
      - repo_id                     = 697155426 -> null
      - squash_merge_commit_message = "COMMIT_MESSAGES" -> null
      - squash_merge_commit_title   = "COMMIT_OR_PR_TITLE" -> null
      - ssh_clone_url               = "git@github.com:DevOpsTestMuurrk/test_devops.git" -> null
      - svn_url                     = "https://github.com/DevOpsTestMuurrk/test_devops" -> null
      - topics                      = [] -> null
      - visibility                  = "public" -> null
      - vulnerability_alerts        = false -> null
    }

  # module.github.github_repository.repo will be destroyed
  # (because github_repository.repo is not in configuration)
  - resource "github_repository" "repo" {
      - allow_auto_merge            = false -> null
      - allow_merge_commit          = true -> null
      - allow_rebase_merge          = true -> null
      - allow_squash_merge          = true -> null
      - archived                    = false -> null
      - auto_init                   = true -> null
      - default_branch              = "main" -> null
      - delete_branch_on_merge      = false -> null
      - etag                        = "W/\"06c9a161a090a3110c1209daa86e3cbe0d6e0bf0ebe02c6c8851204e389cb986\"" -> null
      - full_name                   = "DevOpsTestMuurrk/test_repo" -> null
      - git_clone_url               = "git://github.com/DevOpsTestMuurrk/test_repo.git" -> null
      - has_downloads               = true -> null
      - has_issues                  = true -> null
      - has_projects                = true -> null
      - has_wiki                    = true -> null
      - html_url                    = "https://github.com/DevOpsTestMuurrk/test_repo" -> null
      - http_clone_url              = "https://github.com/DevOpsTestMuurrk/test_repo.git" -> null
      - id                          = "test_repo" -> null
      - is_template                 = false -> null
      - merge_commit_message        = "PR_TITLE" -> null
      - merge_commit_title          = "MERGE_MESSAGE" -> null
      - name                        = "test_repo" -> null
      - node_id                     = "R_kgDOKY26VQ" -> null
      - private                     = false -> null
      - repo_id                     = 697154133 -> null
      - squash_merge_commit_message = "COMMIT_MESSAGES" -> null
      - squash_merge_commit_title   = "COMMIT_OR_PR_TITLE" -> null
      - ssh_clone_url               = "git@github.com:DevOpsTestMuurrk/test_repo.git" -> null
      - svn_url                     = "https://github.com/DevOpsTestMuurrk/test_repo" -> null
      - topics                      = [] -> null
      - visibility                  = "public" -> null
      - vulnerability_alerts        = false -> null
    }

  # module.github_teams.github_repository.example_repository will be created
  + resource "github_repository" "example_repository" {
      + allow_auto_merge            = false
      + allow_merge_commit          = true
      + allow_rebase_merge          = true
      + allow_squash_merge          = true
      + archived                    = false
      + default_branch              = (known after apply)
      + delete_branch_on_merge      = false
      + description                 = "My devOps rep"
      + etag                        = (known after apply)
      + full_name                   = (known after apply)
      + git_clone_url               = (known after apply)
      + html_url                    = (known after apply)
      + http_clone_url              = (known after apply)
      + id                          = (known after apply)
      + merge_commit_message        = "PR_TITLE"
      + merge_commit_title          = "MERGE_MESSAGE"
      + name                        = "ExampleRepository"
      + node_id                     = (known after apply)
      + private                     = (known after apply)
      + repo_id                     = (known after apply)
      + squash_merge_commit_message = "COMMIT_MESSAGES"
      + squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
      + ssh_clone_url               = (known after apply)
      + svn_url                     = (known after apply)
      + visibility                  = "private"
    }

  # module.github_teams.github_team.team_admin will be created
  + resource "github_team" "team_admin" {
      + create_default_maintainer = false
      + etag                      = (known after apply)
      + id                        = (known after apply)
      + members_count             = (known after apply)
      + name                      = "teamAdmin"
      + node_id                   = (known after apply)
      + privacy                   = "secret"
      + slug                      = (known after apply)
    }

  # module.github_teams.github_team.team_push will be created
  + resource "github_team" "team_push" {
      + create_default_maintainer = false
      + etag                      = (known after apply)
      + id                        = (known after apply)
      + members_count             = (known after apply)
      + name                      = "teamPush"
      + node_id                   = (known after apply)
      + privacy                   = "secret"
      + slug                      = (known after apply)
    }

  # module.github_teams.github_team_repository.team_admin_access will be created
  + resource "github_team_repository" "team_admin_access" {
      + etag       = (known after apply)
      + id         = (known after apply)
      + permission = "admin"
      + repository = "ExampleRepository"
      + team_id    = (known after apply)
    }

  # module.github_teams.github_team_repository.team_push_access will be created
  + resource "github_team_repository" "team_push_access" {
      + etag       = (known after apply)
      + id         = (known after apply)
      + permission = "push"
      + repository = "ExampleRepository"
      + team_id    = (known after apply)
    }

Plan: 5 to add, 0 to change, 5 to destroy.
╷
│ Warning: Argument is deprecated
│ 
│   with module.cloud.vkcs_networking_secgroup_rule.secgroup_rule_1,
│   on cloud/network.tf line 34, in resource "vkcs_networking_secgroup_rule" "secgroup_rule_1":
│   34:    ethertype = "IPv4"
│ 
│ Only IPv4 can be used as ethertype. This argument is deprecated, please do not use it.
│ 
│ (and 3 more similar warnings elsewhere)
╵

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.github.github_branch_default.core_main: Destroying... [id=test_devops]
module.github.github_branch_protection.default: Destroying... [id=BPR_kwDOKY2Y684CgZ4_]
module.github_teams.github_team.team_push: Creating...
module.github_teams.github_team.team_admin: Creating...
module.github_teams.github_repository.example_repository: Creating...
module.github.github_branch_default.core_main: Destruction complete after 0s
module.github.github_repository.core: Destroying... [id=test_devops]
module.github.github_branch_protection.default: Destruction complete after 2s
module.github.github_branch_default.main: Destroying... [id=test_repo]
module.github.github_repository.core: Destruction complete after 9s
module.github_teams.github_team.team_push: Still creating... [10s elapsed]
module.github_teams.github_team.team_admin: Still creating... [10s elapsed]
module.github_teams.github_repository.example_repository: Still creating... [10s elapsed]
module.github.github_branch_default.main: Destruction complete after 8s
module.github.github_repository.repo: Destroying... [id=test_repo]
module.github.github_repository.repo: Destruction complete after 6s
module.github_teams.github_team.team_push: Still creating... [20s elapsed]
module.github_teams.github_team.team_admin: Still creating... [20s elapsed]
module.github_teams.github_repository.example_repository: Still creating... [20s elapsed]
module.github_teams.github_team.team_admin: Creation complete after 20s [id=8648409]
module.github_teams.github_team.team_push: Creation complete after 22s [id=8648408]
module.github_teams.github_repository.example_repository: Creation complete after 22s [id=ExampleRepository]
module.github_teams.github_team_repository.team_admin_access: Creating...
module.github_teams.github_team_repository.team_push_access: Creating...
module.github_teams.github_team_repository.team_push_access: Creation complete after 4s [id=8648408:ExampleRepository]
module.github_teams.github_team_repository.team_admin_access: Creation complete after 4s [id=8648409:ExampleRepository]

Apply complete! Resources: 5 added, 0 changed, 5 destroyed.

Outputs:

cpp_container_id = "56541618e3642a36a36411d24565aff42a474c04fd4b4a76c9916733d24db5f0"
python_container_id = "ba04dfc18c9e98a458a5181f634a109aea488447f84317988d179df408888cca"
```

# Best Practice
1. Use modules: Break your infrastructure into reusable modules to promote code reusability, maintainability, and modularity. Modules help in organizing your code and make it easier to manage complex infrastructure.

2. Follow version control: Store your Terraform code in a version control system like Git. This allows you to track changes, collaborate with team members, and roll back changes if needed.

3. Use variables and outputs: Leverage Terraform variables and outputs to make your code more reusable and to configure resources dynamically based on input values.

4. Plan and apply changes: Always run a terraform plan to preview the changes that Terraform will make before applying them with terraform apply. This helps you understand what will happen and prevents unintended actions.
