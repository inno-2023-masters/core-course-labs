### Ansible

#### Deployment Output

```
PLAY [Ping all hosts] ***************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************
ok: [yandex_cloud_01]

TASK [Ping my hosts] ****************************************************************************************************************************
ok: [yandex_cloud_01]

PLAY [Deploy docker from scratch] ***************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************
ok: [yandex_cloud_01]

TASK [docker : Include install_pip] *************************************************************************************************************
included: /mnt/ssd/repos/study/devops/core-course-labs/ansible/roles/docker/tasks/install_pip.yml for yandex_cloud_01

TASK [docker : Update apt repos] ****************************************************************************************************************
ok: [yandex_cloud_01]

TASK [docker : Ensure python3 and pip3 are installed] *******************************************************************************************
ok: [yandex_cloud_01]

TASK [docker : Include install_docker] **********************************************************************************************************
included: /mnt/ssd/repos/study/devops/core-course-labs/ansible/roles/docker/tasks/install_docker.yml for yandex_cloud_01

TASK [docker : Install docker via apt] **********************************************************************************************************
changed: [yandex_cloud_01]

TASK [docker : Include install_compose] *********************************************************************************************************
included: /mnt/ssd/repos/study/devops/core-course-labs/ansible/roles/docker/tasks/install_compose.yml for yandex_cloud_01

TASK [docker : Install docker-compose via pip] **************************************************************************************************
ok: [yandex_cloud_01]

TASK [docker : Include check_docker] ************************************************************************************************************
included: /mnt/ssd/repos/study/devops/core-course-labs/ansible/roles/docker/tasks/check_docker.yml for yandex_cloud_01

TASK [docker : Check docker version] ************************************************************************************************************
changed: [yandex_cloud_01]

TASK [docker : Check docker-compose version] ****************************************************************************************************
changed: [yandex_cloud_01]

TASK [docker : Display docker version] **********************************************************************************************************
ok: [yandex_cloud_01] => {
    "msg": "Docker version 24.0.5, build 24.0.5-0ubuntu1~20.04.1"
}

TASK [docker : Display docker-compose version] **************************************************************************************************
ok: [yandex_cloud_01] => {
    "msg": "docker-compose version 1.29.2, build unknown"
}

PLAY RECAP **************************************************************************************************************************************
yandex_cloud_01            : ok=15   changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

#### Inventory Details

```
{
    "_meta": {
        "hostvars": {
            "yandex_cloud_01": {
                "ansible_host": "yc.local"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped",
            "lab_hosts"
        ]
    },
    "lab_hosts": {
        "hosts": [
            "yandex_cloud_01"
        ]
    }
}
```

This Ansible inventory file defines the hosts and groups that Ansible can manage. Under the _meta key, hostvars assigns the variable ansible_host with value yc.local to the host yandex_cloud_01, indicating that Ansible can access this host at the address yc.local (which ip address is defined in /etc/hosts file because during the lab machine was recreated several times, and there is no need each time to update repository). The all group, which includes all hosts, is defined to have two children groups, ungrouped and lab_hosts. The lab_hosts group is further specified to include the host yandex_cloud_01 which is our machine on which we deploy docker.

As an option it also was possible to define docker and docker-compose versions specifying `docker_version` and `compose_version` respectively, but in this case I chose to leave default values.

---

Output of playbook of deploying docker image with my web app:

```
PLAY [Ping all hosts] ***************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************
ok: [yandex_cloud_01]

TASK [Ping my hosts] ****************************************************************************************************************************
ok: [yandex_cloud_01]

PLAY [Deploy docker from scratch] ***************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************
ok: [yandex_cloud_01]

TASK [docker : Include install_pip] *************************************************************************************************************
included: /mnt/ssd/repos/study/devops/core-course-labs/ansible/roles/docker/tasks/install_pip.yml for yandex_cloud_01

TASK [docker : Update apt repos] ****************************************************************************************************************
ok: [yandex_cloud_01]

TASK [docker : Ensure python3 and pip3 are installed] *******************************************************************************************
ok: [yandex_cloud_01]

TASK [docker : Include install_docker] **********************************************************************************************************
included: /mnt/ssd/repos/study/devops/core-course-labs/ansible/roles/docker/tasks/install_docker.yml for yandex_cloud_01

TASK [docker : Install docker via apt] **********************************************************************************************************
ok: [yandex_cloud_01]

TASK [docker : Include install_compose] *********************************************************************************************************
included: /mnt/ssd/repos/study/devops/core-course-labs/ansible/roles/docker/tasks/install_compose.yml for yandex_cloud_01

TASK [docker : Install docker-compose via pip] **************************************************************************************************
ok: [yandex_cloud_01]

TASK [docker : Include check_docker] ************************************************************************************************************
included: /mnt/ssd/repos/study/devops/core-course-labs/ansible/roles/docker/tasks/check_docker.yml for yandex_cloud_01

TASK [docker : Check docker version] ************************************************************************************************************
changed: [yandex_cloud_01]

TASK [docker : Check docker-compose version] ****************************************************************************************************
changed: [yandex_cloud_01]

TASK [docker : Display docker version] **********************************************************************************************************
ok: [yandex_cloud_01] => {
    "msg": "Docker version 24.0.5, build 24.0.5-0ubuntu1~20.04.1"
}

TASK [docker : Display docker-compose version] **************************************************************************************************
ok: [yandex_cloud_01] => {
    "msg": "docker-compose version 1.29.2, build unknown"
}

PLAY [Deploy web application docker container] **************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************
ok: [yandex_cloud_01]

TASK [web_app : Pull docker image] **************************************************************************************************************
ok: [yandex_cloud_01]

TASK [web_app : Deploy app container] ***********************************************************************************************************
changed: [yandex_cloud_01]

PLAY RECAP **************************************************************************************************************************************
yandex_cloud_01            : ok=18   changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```