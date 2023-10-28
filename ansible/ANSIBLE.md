
## Applied Best practices:
- Using roles for docker and for both web apps

- Directory layout conventions

- Using tag names for each tasks

- Using defaults to store variables

- Using templates, handlers

- Seperating tasks on files for simplicity & managebility

- Using healthcheck after the build


After implementing dynamic inventory:

## ansible-playbook -i inventory/aws_ec2.yaml playbooks/dev/main.yml --diff --key-file ~/.ssh/my_secret_key.pem

```
PLAY [Prepare docker] ***************************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [docker : Execute apt update] **************************************************************************************************************************
changed: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.pip : Ensure Pip is installed.] ***********************************************************************************************************
The following additional packages will be installed:
  build-essential bzip2 cpp cpp-11 dpkg-dev fakeroot fontconfig-config
  fonts-dejavu-core g++ g++-11 gcc gcc-11 gcc-11-base gcc-12-base
  javascript-common libalgorithm-diff-perl libalgorithm-diff-xs-perl
  libalgorithm-merge-perl libasan6 libatomic1 libc-dev-bin libc-devtools libc6
  libc6-dev libcc1-0 libcrypt-dev libdeflate0 libdpkg-perl libexpat1-dev
  libfakeroot libfile-fcntllock-perl libfontconfig1 libgcc-11-dev libgcc-s1
  libgd3 libgomp1 libisl23 libitm1 libjbig0 libjpeg-turbo8 libjpeg8
  libjs-jquery libjs-sphinxdoc libjs-underscore liblsan0 libmpc3 libnsl-dev
  libpython3-dev libpython3.10 libpython3.10-dev libpython3.10-minimal
  libpython3.10-stdlib libquadmath0 libstdc++-11-dev libstdc++6 libtiff5
  libtirpc-dev libtsan0 libubsan1 libwebp7 libxpm4 linux-libc-dev
  lto-disabled-list make manpages-dev python3-dev python3-wheel python3.10
  python3.10-dev python3.10-minimal rpcsvc-proto zlib1g-dev
Suggested packages:
  bzip2-doc cpp-doc gcc-11-locales debian-keyring g++-multilib g++-11-multilib
  gcc-11-doc gcc-multilib autoconf automake libtool flex bison gdb gcc-doc
  gcc-11-multilib apache2 | lighttpd | httpd glibc-doc bzr libgd-tools
  libstdc++-11-doc make-doc python3.10-venv python3.10-doc binfmt-support
Recommended packages:
  libnss-nis libnss-nisplus
The following NEW packages will be installed:
  build-essential bzip2 cpp cpp-11 dpkg-dev fakeroot fontconfig-config
  fonts-dejavu-core g++ g++-11 gcc gcc-11 gcc-11-base javascript-common
  libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl
  libasan6 libatomic1 libc-dev-bin libc-devtools libc6-dev libcc1-0
  libcrypt-dev libdeflate0 libdpkg-perl libexpat1-dev libfakeroot
  libfile-fcntllock-perl libfontconfig1 libgcc-11-dev libgd3 libgomp1 libisl23
  libitm1 libjbig0 libjpeg-turbo8 libjpeg8 libjs-jquery libjs-sphinxdoc
  libjs-underscore liblsan0 libmpc3 libnsl-dev libpython3-dev
  libpython3.10-dev libquadmath0 libstdc++-11-dev libtiff5 libtirpc-dev
  libtsan0 libubsan1 libwebp7 libxpm4 linux-libc-dev lto-disabled-list make
  manpages-dev python3-dev python3-pip python3-wheel python3.10-dev
  rpcsvc-proto zlib1g-dev
The following packages will be upgraded:
  gcc-12-base libc6 libgcc-s1 libpython3.10 libpython3.10-minimal
  libpython3.10-stdlib libstdc++6 python3.10 python3.10-minimal
9 upgraded, 64 newly installed, 0 to remove and 120 not upgraded.
changed: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.pip : Ensure pip_install_packages are installed.] *****************************************************************************************
changed: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com] => (item={'name': 'docker'})
changed: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com] => (item={'name': 'docker-compose'})

TASK [geerlingguy.docker : Load OS-specific vars.] **********************************************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : include_tasks] *******************************************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : include_tasks] *******************************************************************************************************************
included: /home/shohjahon/.ansible/roles/geerlingguy.docker/tasks/setup-Debian.yml for ec2-34-216-21-217.us-west-2.compute.amazonaws.com

TASK [geerlingguy.docker : Ensure old versions of Docker are not installed.] ********************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure dependencies are installed.] **********************************************************************************************
The following NEW packages will be installed:
  apt-transport-https
0 upgraded, 1 newly installed, 0 to remove and 120 not upgraded.
changed: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] *****************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] **************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Add Docker apt key.] *************************************************************************************************************
changed: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure curl is present (on older systems without SNI).] **************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Add Docker apt key (alternative for older systems without SNI).] *****************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Add Docker repository.] **********************************************************************************************************
--- before: /dev/null
+++ after: /etc/apt/sources.list.d/download_docker_com_linux_ubuntu.list
@@ -0,0 +1 @@
+deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/docker.asc] https://download.docker.com/linux/ubuntu jammy stable

changed: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Install Docker packages.] ********************************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] ********************************************************************************
The following additional packages will be installed:
  docker-buildx-plugin docker-compose-plugin libltdl7 libslirp0 pigz
  slirp4netns
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
The following NEW packages will be installed:
  containerd.io docker-buildx-plugin docker-ce docker-ce-cli
  docker-ce-rootless-extras docker-compose-plugin libltdl7 libslirp0 pigz
  slirp4netns
0 upgraded, 10 newly installed, 0 to remove and 120 not upgraded.
changed: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Install docker-compose plugin.] **************************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] **************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] *******************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Configure Docker daemon options.] ************************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] ***********************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] *******************************************************************

RUNNING HANDLER [geerlingguy.docker : restart docker] *******************************************************************************************************
changed: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : include_tasks] *******************************************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Get docker group info using getent.] *********************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : include_tasks] *******************************************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

PLAY RECAP **************************************************************************************************************************************************
ec2-34-216-21-217.us-west-2.compute.amazonaws.com : ok=14   changed=8    unreachable=0    failed=0    skipped=13   rescued=0    ignored=0
```

### ansible-inventory -i inventory/aws_ec2.yaml --list

```
{
    "_meta": {
        "hostvars": {
            "ec2-34-216-21-217.us-west-2.compute.amazonaws.com": {
                "ami_launch_index": 0,
                "architecture": "x86_64",
                "block_device_mappings": [
                    {
                        "device_name": "/dev/sda1",
                        "ebs": {
                            "attach_time": "2023-10-08T15:57:37+00:00",
                            "delete_on_termination": true,
                            "status": "attached",
                            "volume_id": "vol-09b3bf4e952ab9a37"
                        }
                    }
                ],
                "capacity_reservation_specification": {
                    "capacity_reservation_preference": "open"
                },
                "client_token": "b80531cb-b85f-4ea0-9865-b9d217714ff7",
                "cpu_options": {
                    "core_count": 1,
                    "threads_per_core": 1
                },
                "current_instance_boot_mode": "legacy-bios",
                "ebs_optimized": false,
                "ena_support": true,
                "enclave_options": {
                    "enabled": false
                },
                "hibernation_options": {
                    "configured": false
                },
                "hypervisor": "xen",
                "iam_instance_profile": {
                    "arn": "arn:aws:iam::150479635815:instance-profile/AdminAccess",
                    "id": "AIPASGCKJAVTXR2LC7NLL"
                },
                "image_id": "ami-03f65b8614a860c29",
                "instance_id": "i-0bf66f701604827f3",
                "instance_type": "t2.micro",
                "key_name": "my_secret_key",
                "launch_time": "2023-10-08T15:57:36+00:00",
                "maintenance_options": {
                    "auto_recovery": "default"
                },
                "metadata_options": {
                    "http_endpoint": "enabled",
                    "http_protocol_ipv6": "disabled",
                    "http_put_response_hop_limit": 1,
                    "http_tokens": "optional",
                    "instance_metadata_tags": "disabled",
                    "state": "applied"
                },
                "monitoring": {
                    "state": "disabled"
                },
                "network_interfaces": [
                    {
                        "association": {
                            "ip_owner_id": "amazon",
                            "public_dns_name": "ec2-34-216-21-217.us-west-2.compute.amazonaws.com",
                            "public_ip": "34.216.21.217"
                        },
                        "attachment": {
                            "attach_time": "2023-10-08T15:57:36+00:00",
                            "attachment_id": "eni-attach-0c16104e24d3d63a3",
                            "delete_on_termination": true,
                            "device_index": 0,
                            "network_card_index": 0,
                            "status": "attached"
                        },
                        "description": "",
                        "groups": [
                            {
                                "group_id": "sg-0fcb7761bb252ba38",
                                "group_name": "launch-wizard-1"
                            }
                        ],
                        "interface_type": "interface",
                        "ipv6_addresses": [],
                        "mac_address": "02:6b:87:86:f0:ab",
                        "network_interface_id": "eni-0fb039ab5c694381c",
                        "owner_id": "150479635815",
                        "private_dns_name": "ip-172-31-29-147.us-west-2.compute.internal",
                        "private_ip_address": "172.31.29.147",
                        "private_ip_addresses": [
                            {
                                "association": {
                                    "ip_owner_id": "amazon",
                                    "public_dns_name": "ec2-34-216-21-217.us-west-2.compute.amazonaws.com",
                                    "public_ip": "34.216.21.217"
                                },
                                "primary": true,
                                "private_dns_name": "ip-172-31-29-147.us-west-2.compute.internal",
                                "private_ip_address": "172.31.29.147"
                            }
                        ],
                        "source_dest_check": true,
                        "status": "in-use",
                        "subnet_id": "subnet-0fffe2b4595171c0b",
                        "vpc_id": "vpc-09aed16b569ae45c1"
                    }
                ],
                "owner_id": "150479635815",
                "placement": {
                    "availability_zone": "us-west-2b",
                    "group_name": "",
                    "region": "us-west-2",
                    "tenancy": "default"
                },
                "platform_details": "Linux/UNIX",
                "private_dns_name": "ip-172-31-29-147.us-west-2.compute.internal",
                "private_dns_name_options": {
                    "enable_resource_name_dns_a_record": true,
                    "enable_resource_name_dns_aaaa_record": false,
                    "hostname_type": "ip-name"
                },
                "private_ip_address": "172.31.29.147",
                "product_codes": [],
                "public_dns_name": "ec2-34-216-21-217.us-west-2.compute.amazonaws.com",
                "public_ip_address": "34.216.21.217",
                "requester_id": "",
                "reservation_id": "r-05f2d4906b97a8598",
                "root_device_name": "/dev/sda1",
                "root_device_type": "ebs",
                "security_groups": [
                    {
                        "group_id": "sg-0fcb7761bb252ba38",
                        "group_name": "launch-wizard-1"
                    }
                ],
                "source_dest_check": true,
                "state": {
                    "code": 16,
                    "name": "running"
                },
                "state_transition_reason": "",
                "subnet_id": "subnet-0fffe2b4595171c0b",
                "tags": {
                    "Name": "devOps_server"
                },
                "usage_operation": "RunInstances",
                "usage_operation_update_time": "2023-10-08T15:57:36+00:00",
                "virtualization_type": "hvm",
                "vpc_id": "vpc-09aed16b569ae45c1"
            },
            "ec2-35-88-242-127.us-west-2.compute.amazonaws.com": {
                "ami_launch_index": 0,
                "architecture": "x86_64",
                "block_device_mappings": [
                    {
                        "device_name": "/dev/sda1",
                        "ebs": {
                            "attach_time": "2023-10-08T15:13:00+00:00",
                            "delete_on_termination": true,
                            "status": "attached",
                            "volume_id": "vol-01597e6688b6df188"
                        }
                    }
                ],
                "capacity_reservation_specification": {
                    "capacity_reservation_preference": "open"
                },
                "client_token": "terraform-20231008151300013800000001",
                "cpu_options": {
                    "core_count": 1,
                    "threads_per_core": 1
                },
                "current_instance_boot_mode": "legacy-bios",
                "ebs_optimized": false,
                "enclave_options": {
                    "enabled": false
                },
                "hibernation_options": {
                    "configured": false
                },
                "hypervisor": "xen",
                "iam_instance_profile": {
                    "arn": "arn:aws:iam::150479635815:instance-profile/AdminAccess",
                    "id": "AIPASGCKJAVTXR2LC7NLL"
                },
                "image_id": "ami-830c94e3",
                "instance_id": "i-091b72ba467c9604b",
                "instance_type": "t2.micro",
                "launch_time": "2023-10-08T15:12:59+00:00",
                "maintenance_options": {
                    "auto_recovery": "default"
                },
                "metadata_options": {
                    "http_endpoint": "enabled",
                    "http_protocol_ipv6": "disabled",
                    "http_put_response_hop_limit": 1,
                    "http_tokens": "optional",
                    "instance_metadata_tags": "disabled",
                    "state": "applied"
                },
                "monitoring": {
                    "state": "disabled"
                },
                "network_interfaces": [
                    {
                        "association": {
                            "ip_owner_id": "amazon",
                            "public_dns_name": "ec2-35-88-242-127.us-west-2.compute.amazonaws.com",
                            "public_ip": "35.88.242.127"
                        },
                        "attachment": {
                            "attach_time": "2023-10-08T15:12:59+00:00",
                            "attachment_id": "eni-attach-04b03def09bbcaa2e",
                            "delete_on_termination": true,
                            "device_index": 0,
                            "network_card_index": 0,
                            "status": "attached"
                        },
                        "description": "",
                        "groups": [
                            {
                                "group_id": "sg-073bb22849dea28f7",
                                "group_name": "default"
                            }
                        ],
                        "interface_type": "interface",
                        "ipv6_addresses": [],
                        "mac_address": "02:23:fe:78:53:a9",
                        "network_interface_id": "eni-01510414908b14101",
                        "owner_id": "150479635815",
                        "private_dns_name": "ip-172-31-24-45.us-west-2.compute.internal",
                        "private_ip_address": "172.31.24.45",
                        "private_ip_addresses": [
                            {
                                "association": {
                                    "ip_owner_id": "amazon",
                                    "public_dns_name": "ec2-35-88-242-127.us-west-2.compute.amazonaws.com",
                                    "public_ip": "35.88.242.127"
                                },
                                "primary": true,
                                "private_dns_name": "ip-172-31-24-45.us-west-2.compute.internal",
                                "private_ip_address": "172.31.24.45"
                            }
                        ],
                        "source_dest_check": true,
                        "status": "in-use",
                        "subnet_id": "subnet-0fffe2b4595171c0b",
                        "vpc_id": "vpc-09aed16b569ae45c1"
                    }
                ],
                "owner_id": "150479635815",
                "placement": {
                    "availability_zone": "us-west-2b",
                    "group_name": "",
                    "region": "us-west-2",
                    "tenancy": "default"
                },
                "platform_details": "Linux/UNIX",
                "private_dns_name": "ip-172-31-24-45.us-west-2.compute.internal",
                "private_dns_name_options": {
                    "enable_resource_name_dns_a_record": false,
                    "enable_resource_name_dns_aaaa_record": false,
                    "hostname_type": "ip-name"
                },
                "private_ip_address": "172.31.24.45",
                "product_codes": [],
                "public_dns_name": "ec2-35-88-242-127.us-west-2.compute.amazonaws.com",
                "public_ip_address": "35.88.242.127",
                "requester_id": "",
                "reservation_id": "r-089c990d7b77b8c4c",
                "root_device_name": "/dev/sda1",
                "root_device_type": "ebs",
                "security_groups": [
                    {
                        "group_id": "sg-073bb22849dea28f7",
                        "group_name": "default"
                    }
                ],
                "source_dest_check": true,
                "state": {
                    "code": 16,
                    "name": "running"
                },
                "state_transition_reason": "",
                "subnet_id": "subnet-0fffe2b4595171c0b",
                "tags": {
                    "Name": "ansible-server"
                },
                "usage_operation": "RunInstances",
                "usage_operation_update_time": "2023-10-08T15:12:59+00:00",
                "virtualization_type": "hvm",
                "vpc_id": "vpc-09aed16b569ae45c1"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped",
            "aws_ec2"
        ]
    },
    "aws_ec2": {
        "hosts": [
            "ec2-35-88-242-127.us-west-2.compute.amazonaws.com",
            "ec2-34-216-21-217.us-west-2.compute.amazonaws.com"
        ]
    }
}
```


# Lab 6

## app_python:
### ansible-playbook -i inventory/aws_ec2.yaml playbooks/dev/app_python/main.yml --diff --key-file ~/.ssh/my_secret_key.pem -e web_app_full_wipe=true

```
PLAY [app_python_lab6] **************************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [docker : Execute apt update] **************************************************************************************************************************
changed: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.pip : Ensure Pip is installed.] ***********************************************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.pip : Ensure pip_install_packages are installed.] *****************************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com] => (item={'name': 'docker'})
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com] => (item={'name': 'docker-compose'})

TASK [geerlingguy.docker : Load OS-specific vars.] **********************************************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : include_tasks] *******************************************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : include_tasks] *******************************************************************************************************************
included: /home/shohjahon/.ansible/roles/geerlingguy.docker/tasks/setup-Debian.yml for ec2-34-216-21-217.us-west-2.compute.amazonaws.com

TASK [geerlingguy.docker : Ensure old versions of Docker are not installed.] ********************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure dependencies are installed.] **********************************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] *****************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] **************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Add Docker apt key.] *************************************************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure curl is present (on older systems without SNI).] **************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Add Docker apt key (alternative for older systems without SNI).] *****************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Add Docker repository.] **********************************************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Install Docker packages.] ********************************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] ********************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Install docker-compose plugin.] **************************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] **************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] *******************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Configure Docker daemon options.] ************************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] ***********************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] *******************************************************************

TASK [geerlingguy.docker : include_tasks] *******************************************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Get docker group info using getent.] *********************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : include_tasks] *******************************************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [web_app : Check if docker-compose.yml file exists] ****************************************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [web_app : Check if Web App directory exists] **********************************************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [web_app : Docker Compose remove] **********************************************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [web_app : Remove directory /app_python] ***************************************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [web_app : Create directory /app_python] ***************************************************************************************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/app_python",
-    "state": "absent"
+    "state": "directory"
 }

changed: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [web_app : Template Docker Compose configuration] ******************************************************************************************************
--- before
+++ after: /home/shohjahon/.ansible/tmp/ansible-local-2311xvh_4s4r/tmp_j3y177j/docker-compose.yml.j2
@@ -0,0 +1,16 @@
+version: '3.8'
+services:
+  'app_python':
+    image: 'docker.io/rametago/my-first-repo:latest'
+    container_name: 'app_python'
+    restart: always
+    ports:
+      - '5000:8080'
+    healthcheck:
+      test:
+        - CMD-SHELL
+        - wget --no-verbose --tries=1 -O /dev/null http://localhost:8080/healthcheck || exit 1
+      interval: 1m30s
+      timeout: 10s
+      retries: 3
+      start_period: 5s
\ No newline at end of file

changed: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [web_app : Pull images] ********************************************************************************************************************************
changed: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

RUNNING HANDLER [web_app : Restart Docker Compose] **********************************************************************************************************
changed: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

PLAY RECAP **************************************************************************************************************************************************
ec2-34-216-21-217.us-west-2.compute.amazonaws.com : ok=19   changed=5    unreachable=0    failed=0    skipped=15   rescued=0    ignored=0
```
## Structure:

```
.
|-- defaults
|   `-- main.yml
|-- meta
|   `-- main.yml
|-- tasks
|   |-- wiper.yml
|   |-- main.yml
    `-- installer.yml
`-- templates
   `-- docker-compose.yml.j2
```

## app_typescript (Bonus Task):
### ansible-playbook -i inventory/aws_ec2.yaml playbooks/dev/app_typescript/main.yml --diff --key-file ~/.ssh/my_secret_key.pem -e web_app_full_wipe=true

```
PLAY [app_typescript_lab6] **********************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [docker : Execute apt update] **************************************************************************************************************************
changed: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.pip : Ensure Pip is installed.] ***********************************************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.pip : Ensure pip_install_packages are installed.] *****************************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com] => (item={'name': 'docker'})
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com] => (item={'name': 'docker-compose'})

TASK [geerlingguy.docker : Load OS-specific vars.] **********************************************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : include_tasks] *******************************************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : include_tasks] *******************************************************************************************************************
included: /home/shohjahon/.ansible/roles/geerlingguy.docker/tasks/setup-Debian.yml for ec2-34-216-21-217.us-west-2.compute.amazonaws.com

TASK [geerlingguy.docker : Ensure old versions of Docker are not installed.] ********************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure dependencies are installed.] **********************************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] *****************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] **************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Add Docker apt key.] *************************************************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure curl is present (on older systems without SNI).] **************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Add Docker apt key (alternative for older systems without SNI).] *****************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Add Docker repository.] **********************************************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Install Docker packages.] ********************************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] ********************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Install docker-compose plugin.] **************************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] **************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] *******************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Configure Docker daemon options.] ************************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] ***********************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] *******************************************************************

TASK [geerlingguy.docker : include_tasks] *******************************************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Get docker group info using getent.] *********************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [geerlingguy.docker : include_tasks] *******************************************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [web_app : Check if docker-compose.yml file exists] ****************************************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [web_app : Check if Web App directory exists] **********************************************************************************************************
ok: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [web_app : Docker Compose remove] **********************************************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [web_app : Remove directory /app_typescript] ***********************************************************************************************************
skipping: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [web_app : Create directory /app_typescript] ***********************************************************************************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/app_typescript",
-    "state": "absent"
+    "state": "directory"
 }

changed: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [web_app : Template Docker Compose configuration] ******************************************************************************************************
--- before
+++ after: /home/shohjahon/.ansible/tmp/ansible-local-2630nwdgkq2h/tmpfn5n_9a3/docker-compose.yml.j2
@@ -0,0 +1,16 @@
+version: '3.8'
+services:
+  'app_typescript':
+    image: 'docker.io/rametago/my-first-repo:svelte'
+    container_name: 'app_typescript'
+    restart: always
+    ports:
+      - '5173:5173'
+    healthcheck:
+      test:
+        - CMD-SHELL
+        - wget --no-verbose --tries=1 -O /dev/null http://localhost:5173/healthcheck || exit 1
+      interval: 1m30s
+      timeout: 10s
+      retries: 3
+      start_period: 5s
\ No newline at end of file

changed: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

TASK [web_app : Pull images] ********************************************************************************************************************************
changed: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

RUNNING HANDLER [web_app : Restart Docker Compose] **********************************************************************************************************
changed: [ec2-34-216-21-217.us-west-2.compute.amazonaws.com]

PLAY RECAP **************************************************************************************************************************************************
ec2-34-216-21-217.us-west-2.compute.amazonaws.com : ok=19   changed=5    unreachable=0    failed=0    skipped=15   rescued=0    ignored=0
```
