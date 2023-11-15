# Terraform

## Docker infrastructure

```bash
4$ ➜ terraform state list                                                                                                                 ~/pr/in/devops/terraform/docker git:lab4 (1?1!) ERROR
docker_container.nginx
docker_image.nginx
4$ ➜ terraform state show docker_container.nginx                                                                                                ~/pr/in/devops/terraform/docker git:lab4 (1?1!)
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
    hostname                                    = "f181df293981"
    id                                          = "f181df2939811cea2592f2b5019c22ef93ce12c752f99357b4dfcd59020f4b88"
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
        external = 8080
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}
4$ ➜ terraform output                                                                                                                           ~/pr/in/devops/terraform/docker git:lab4 (1?1!)
container_id = "f181df2939811cea2592f2b5019c22ef93ce12c752f99357b4dfcd59020f4b88"
image_id = "sha256:61395b4c586da2b9b3b7ca903ea6a448e6783dfdd7f768ff2c1a0f3360aaba99nginx:latest"
4$ ➜ docker ps -a                                                                                                                               ~/pr/in/devops/terraform/docker git:lab4 (1?1!)
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
f181df293981   61395b4c586d   "/docker-entrypoint.…"   3 minutes ago   Up 3 minutes   0.0.0.0:8080->80/tcp   ExampleNginxContainer
4$ ➜ 
```

## Compute

```bash
4$ ➜ terraform state list                                                                                                                  ~/pr/in/devops/terraform/cloud git:lab4 (1*1?1!) 59s
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
4$ ➜ terraform state show vkcs_compute_instance.compute                                                                                        ~/pr/in/devops/terraform/cloud git:lab4 (1*1?1!)
# vkcs_compute_instance.compute:
resource "vkcs_compute_instance" "compute" {
    access_ip_v4        = "192.168.199.30"
    all_metadata        = {}
    all_tags            = []
    availability_zone   = "MS1"
    flavor_id           = "25ae869c-be29-4840-8e12-99e046d2dbd4"
    flavor_name         = "Basic-1-2-20"
    force_delete        = false
    id                  = "12f0911f-d4f9-4524-829d-71b835214fd6"
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
        fixed_ip_v4    = "192.168.199.30"
        mac            = "fa:16:3e:af:6b:f8"
        name           = "net"
        uuid           = "22026d3e-9307-48c2-80ab-4f5355cc11f3"
    }
}
4$ ➜ terraform output                                                                                                                          ~/pr/in/devops/terraform/cloud git:lab4 (1*1?1!)
instance_fip = "212.233.95.140"
4$ ➜ ssh ubuntu@212.233.95.140                                                                                                                 ~/pr/in/devops/terraform/cloud git:lab4 (1*1?1!)
Welcome to Ubuntu 22.04.1 LTS (GNU/Linux 5.15.0-46-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Tue Sep 26 19:32:27 UTC 2023

  System load:  0.08740234375     Processes:             100
  Usage of /:   36.2% of 7.42GB   Users logged in:       1
  Memory usage: 11%               IPv4 address for ens3: 192.168.199.30
  Swap usage:   0%


0 updates can be applied immediately.


The list of available updates is more than a week old.
To check for new updates run: sudo apt update

Last login: Tue Sep 26 19:31:02 2023 from 188.130.155.153
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@compute-instance:~$ 
logout
Connection to 212.233.95.140 closed.
```
