Install Docker
```
PLAY [Configure Docker] ********************************************************

TASK [Gathering Facts] *********************************************************
ok: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Load OS-specific vars.] *****************************
ok: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : include_tasks] **************************************
skipping: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : include_tasks] **************************************
included: /home/muurrk/core-course-labs/ansible/roles/geerlingguy.docker/tasks/setup-Debian.yml for ubuntu@37.139.32.36

TASK [geerlingguy.docker : Ensure old versions of Docker are not installed.] ***
ok: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Ensure dependencies are installed.] *****************
ok: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ***
skipping: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] ***
ok: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Add Docker apt key.] ********************************
ok: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Ensure curl is present (on older systems without SNI).] ***
skipping: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Add Docker apt key (alternative for older systems without SNI).] ***
skipping: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Add Docker repository.] *****************************
ok: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Install Docker packages.] ***************************
skipping: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] ***
ok: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Install docker-compose plugin.] *********************
skipping: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] ***
ok: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] **************
skipping: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Configure Docker daemon options.] *******************
skipping: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] ******
ok: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] ***

TASK [geerlingguy.docker : include_tasks] **************************************
skipping: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Get docker group info using getent.] ****************
skipping: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ***
skipping: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : include_tasks] **************************************
skipping: [ubuntu@37.139.32.36]

PLAY RECAP *********************************************************************
ubuntu@37.139.32.36        : ok=11   changed=0    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0   
```
Inventory
```
muurrk@muurrk-PS42-8M:~/core-course-labs/ansible$ ansible-inventory -i inventory/inventory.ini --list
{
    "_meta": {
        "hostvars": {}
    },
    "all": {
        "children": [
            "ungrouped",
            "webservers"
        ]
    },
    "webservers": {
        "hosts": [
            "ubuntu@37.139.32.36"
        ]
    }
}
```
Dynamic Inventory
```
{
    "_meta": {
        "hostvars": {
            "192.168.199.12": {
                "access_ip_v4": "192.168.199.12",
                "admin_pass": "<error>",
                "all_metadata.#": "0",
                "all_tags.#": "0",
                "ansible_host": "192.168.199.12",
                "availability_zone": "MS1",
                "block_device.#": "1",
                "block_device.0.boot_index": "<error>",
                "block_device.0.delete_on_termination": "<error>",
                "block_device.0.destination_type": "volume",
                "block_device.0.device_type": "",
                "block_device.0.disk_bus": "",
                "block_device.0.guest_format": "",
                "block_device.0.source_type": "image",
                "block_device.0.uuid": "b75595ca-4e1d-47e0-8e95-7a02edc0e242",
                "block_device.0.volume_size": "<error>",
                "block_device.0.volume_type": "ceph-ssd",
                "config_drive": "<error>",
                "cpp_container_id": "f7a6358d1d812183737d1297076e28a8fae03ff3f634947f403620e74ffb2b0b",
                "flavor_id": "25ae869c-be29-4840-8e12-99e046d2dbd4",
                "flavor_name": "Basic-1-2-20",
                "force_delete": "<error>",
                "id": "ae7896f8-c023-4310-986b-fc7b37f0a552",
                "image_id": "Attempt to boot from volume - no image supplied",
                "image_name": "<error>",
                "key_pair": "DevOpsLab",
                "metadata": "<error>",
                "name": "compute-instance",
                "network.#": "1",
                "network.0.access_network": "<error>",
                "network.0.fixed_ip_v4": "192.168.199.12",
                "network.0.mac": "fa:16:3e:3f:27:9c",
                "network.0.name": "net",
                "network.0.port": "",
                "network.0.uuid": "7681574c-948b-4a64-a42b-1acdacc992e0",
                "network_mode": "<error>",
                "personality.#": "0",
                "power_state": "active",
                "python_container_id": "efc89c0cd7e5853c302e30982480c3ecbfb0e68b1756e3d0571ccc55c3f8c156",
                "region": "RegionOne",
                "scheduler_hints.#": "0",
                "security_groups.#": "2",
                "security_groups.0": "default",
                "security_groups.1": "security_group",
                "stop_before_destroy": "<error>",
                "tags.#": "0",
                "timeouts": "<error>",
                "user_data": "<error>",
                "vendor_options.#": "0"
            },
            "37.139.32.36": {
                "ansible_host": "37.139.32.36",
                "cpp_container_id": "f7a6358d1d812183737d1297076e28a8fae03ff3f634947f403620e74ffb2b0b",
                "fixed_ip": "",
                "floating_ip": "37.139.32.36",
                "id": "37.139.32.36/ae7896f8-c023-4310-986b-fc7b37f0a552/",
                "instance_id": "ae7896f8-c023-4310-986b-fc7b37f0a552",
                "python_container_id": "efc89c0cd7e5853c302e30982480c3ecbfb0e68b1756e3d0571ccc55c3f8c156",
                "region": "RegionOne",
                "timeouts": "<error>",
                "wait_until_associated": "<error>"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped",
            "module_cloud_compute",
            "module_cloud_compute_0",
            "module_cloud_fip",
            "module_cloud_fip_0",
            "type_vkcs_compute_floatingip_associate",
            "type_vkcs_compute_instance"
        ]
    },
    "module_cloud_compute": {
        "hosts": [
            "192.168.199.12"
        ]
    },
    "module_cloud_compute_0": {
        "hosts": [
            "192.168.199.12"
        ]
    },
    "module_cloud_fip": {
        "hosts": [
            "37.139.32.36"
        ]
    },
    "module_cloud_fip_0": {
        "hosts": [
            "37.139.32.36"
        ]
    },
    "type_vkcs_compute_floatingip_associate": {
        "hosts": [
            "37.139.32.36"
        ]
    },
    "type_vkcs_compute_instance": {
        "hosts": [
            "192.168.199.12"
        ]
    }
}
```