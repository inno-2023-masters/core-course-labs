# Ansible

---

## Best practices applied
Some practices were take from the [official guide](https://docs.ansible.com/ansible/2.8/user_guide/playbooks_best_practices.html#id23).
* Use dynamic inventory with clouds.
* Configuration file `ansible.cfg` not to repeat useful information.
* Use roles instead of a huge list of tasks inside a playbook.
* Compliance with directory layout conventions (`role/handlers/`, `role/tasks/`, etc.).
* Always name tasks.
* Group Tasks with Blocks.
* Set roles dependency.
* Apply tags.
* Create Wipe task with separate tag.
* Whitespace and comments.
* Use version control. Keep your playbooks and inventory file in `git`.

---

## Docker & Docker Compose

### Deployment
My custom role is used for deployment.

**Command:**
```shell
ansible-playbook playbooks/dev/main.yml 
```

**Output:**
```
PLAY [Deploy Docker] ************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************
ok: [yandex_my_vm_01]

TASK [docker : Install pip] *****************************************************************************************************************************
included: {...}/iu-devops-course/ansible/roles/docker/tasks/install_pip.yml for yandex_my_vm_01

TASK [docker : Update apt] ******************************************************************************************************************************
changed: [yandex_my_vm_01]

TASK [docker : Install python] **************************************************************************************************************************
ok: [yandex_my_vm_01]

TASK [docker : Install pip] *****************************************************************************************************************************
changed: [yandex_my_vm_01]

TASK [docker : Install docker] **************************************************************************************************************************
included: {...}/iu-devops-course/ansible/roles/docker/tasks/install_docker.yml for yandex_my_vm_01

TASK [docker : Install docker] **************************************************************************************************************************
changed: [yandex_my_vm_01]

TASK [docker : Install docker-compose] ******************************************************************************************************************
included: {...}/iu-devops-course/ansible/roles/docker/tasks/install_compose.yml for yandex_my_vm_01

TASK [docker : Install docker-compose via pip] **********************************************************************************************************
changed: [yandex_my_vm_01]

PLAY RECAP **********************************************************************************************************************************************
yandex_my_vm_01            : ok=9    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
<u>Note</u>: absolute paths to role's tasks are masked.

### Inventory Details

**Command:**
```shell
ansible-inventory --list
```

**Output:**
```
{
    "_meta": {
        "hostvars": {
            "yandex_my_vm_01": {
                "ansible_host": "84.201.162.178",
                "ansible_user": "ubuntu"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped",
            "yandex_b_vms"
        ]
    },
    "yandex_b_vms": {
        "hosts": [
            "yandex_my_vm_01"
        ]
    }
}

```

---

## Dynamic Inventory

I have used inventory plugin for Yandex Cloud from task description suggestions:
https://github.com/rodion-goritskov/yacloud_compute/blob/master/yacloud_compute.py

It is placed in `/ansible/plugins/inventory/yacloud_compute.py`.


**Command:**
```shell
ansible-playbook playbooks/dev/main.yml --diff
```

**Output:**
```
PLAY [Deploy Docker] ************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************
ok: [terraform-vm]

TASK [docker : Install pip] *****************************************************************************************************************************
included: {...}/iu-devops-course/ansible/roles/docker/tasks/install_pip.yml for terraform-vm

TASK [docker : Update apt] ******************************************************************************************************************************
changed: [terraform-vm]

TASK [docker : Install python] **************************************************************************************************************************
ok: [terraform-vm]

TASK [docker : Install pip] *****************************************************************************************************************************
ok: [terraform-vm]

TASK [docker : Install docker] **************************************************************************************************************************
included: {...}/iu-devops-course/ansible/roles/docker/tasks/install_docker.yml for terraform-vm

TASK [docker : Install docker] **************************************************************************************************************************
ok: [terraform-vm]

TASK [docker : Install docker-compose] ******************************************************************************************************************
included: {...}/iu-devops-course/ansible/roles/docker/tasks/install_compose.yml for terraform-vm

TASK [docker : Install docker-compose via pip] **********************************************************************************************************
ok: [terraform-vm]

PLAY RECAP **********************************************************************************************************************************************
```
<u>Note</u>: absolute paths to role's tasks are also masked.

<u>Note</u>: VM's name is taken from Yandex Cloud => dynamic hosts resolution works fine.

---

## Application Deployment

### Python App
**Command:**
```shell
ansible-playbook playbooks/dev/app_python/main.yml
```
**Output (last 50 lines):**
```
...

TASK [docker : Install python3-pip via apt] ************************************
ok: [terraform-vm]

TASK [docker : Install docker-compose using pip] *******************************
included: {...}/iu-devops-course/ansible/roles/docker/tasks/install_compose.yml for terraform-vm

TASK [docker : Install docker-compose via pip] *********************************
ok: [terraform-vm]

TASK [web_app : Check web_app_deployment_way] **********************************
skipping: [terraform-vm]

TASK [web_app : Get container info] ********************************************
ok: [terraform-vm]

TASK [web_app : Stop container if it is running] *******************************
skipping: [terraform-vm]

TASK [web_app : Check Docker-Compose file exists] ******************************
skipping: [terraform-vm]

TASK [web_app : Stop Docker-Compose services] **********************************
skipping: [terraform-vm]

TASK [web_app : Remove container] **********************************************
ok: [terraform-vm]

TASK [web_app : Remove image] **************************************************
ok: [terraform-vm]

TASK [web_app : Check Docker-Compose file exists] ******************************
skipping: [terraform-vm]

TASK [web_app : Remove Docker-Compose services] ********************************
skipping: [terraform-vm]

TASK [web_app : Remove application's directory with it's content] **************
skipping: [terraform-vm]

TASK [web_app : Deploy Application using Docker] *******************************
changed: [terraform-vm]

TASK [web_app : Create application directory] **********************************
skipping: [terraform-vm]

TASK [web_app : Create Docker-Compose file from template] **********************
skipping: [terraform-vm]

PLAY RECAP *********************************************************************
terraform-vm               : ok=18   changed=1    unreachable=0    failed=0    skipped=9    rescued=0    ignored=0   
```
<u>Note</u>: absolute paths to role's tasks are also masked.

### Kotlin App
**Command:**
```shell
ansible-playbook playbooks/dev/app_kotlin/main.yml
```
**Output (last 50 lines):**
```
...

TASK [docker : Install python3-pip via apt] ************************************
ok: [terraform-vm]

TASK [docker : Install docker-compose using pip] *******************************
included: {...}/iu-devops-course/ansible/roles/docker/tasks/install_compose.yml for terraform-vm

TASK [docker : Install docker-compose via pip] *********************************
ok: [terraform-vm]

TASK [web_app : Check web_app_deployment_way] **********************************
skipping: [terraform-vm]

TASK [web_app : Get container info] ********************************************
ok: [terraform-vm]

TASK [web_app : Stop container if it is running] *******************************
skipping: [terraform-vm]

TASK [web_app : Check Docker-Compose file exists] ******************************
skipping: [terraform-vm]

TASK [web_app : Stop Docker-Compose services] **********************************
skipping: [terraform-vm]

TASK [web_app : Remove container] **********************************************
ok: [terraform-vm]

TASK [web_app : Remove image] **************************************************
ok: [terraform-vm]

TASK [web_app : Check Docker-Compose file exists] ******************************
skipping: [terraform-vm]

TASK [web_app : Remove Docker-Compose services] ********************************
skipping: [terraform-vm]

TASK [web_app : Remove application's directory with it's content] **************
skipping: [terraform-vm]

TASK [web_app : Deploy Application using Docker] *******************************
changed: [terraform-vm]

TASK [web_app : Create application directory] **********************************
skipping: [terraform-vm]

TASK [web_app : Create Docker-Compose file from template] **********************
skipping: [terraform-vm]

PLAY RECAP *********************************************************************
terraform-vm               : ok=18   changed=1    unreachable=0    failed=0    skipped=9    rescued=0    ignored=0   
```
<u>Note</u>: absolute paths to role's tasks are also masked.
