# Ansible

I created 2 roles for ansible: `docker` and `web_app`

- `docker` role is described in `roles/docker/README.md`
- `web_app` role is for running docker image in docker-compose

```yaml
# roles/web_app/defaults/main.yml
docker_image: kernie/time-python:latest
docker_container_name: time_python
docker_port: 8000
host_port: 80
```

Also, I have implemented [dynamic inventory](https://github.com/rodion-goritskov/yacloud_compute) for Yandex Cloud.

## Best practices

I followed [Ansible Best Practices](https://docs.ansible.com/ansible/latest/tips_tricks/ansible_tips_tricks.html)
and recommended directory structure from task definition.

## Playbook diff

```shell
$ ansible-playbook playbooks/dev/main.yaml -u ubuntu --diff
YACLOUD DYNAMIC INV
PARSE

PLAY [all] *************************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************************************************************************
ok: [devops-vm]

TASK [docker : include_tasks] ******************************************************************************************************************************************************************************************************
included: /mnt/c/Users/Computer/PycharmProjects/core-course-labs/ansible/roles/docker/tasks/install_docker_repo.yml for devops-vm

TASK [docker : Add Docker GPG apt Key] *********************************************************************************************************************************************************************************************
ok: [devops-vm]

TASK [docker : Add Docker Repository] **********************************************************************************************************************************************************************************************
ok: [devops-vm]

TASK [docker : include_tasks] ******************************************************************************************************************************************************************************************************
included: /mnt/c/Users/Computer/PycharmProjects/core-course-labs/ansible/roles/docker/tasks/install_docker.yml for devops-vm

TASK [docker : Update apt and install docker-ce] ***********************************************************************************************************************************************************************************
ok: [devops-vm]

TASK [docker : include_tasks] ******************************************************************************************************************************************************************************************************
included: /mnt/c/Users/Computer/PycharmProjects/core-course-labs/ansible/roles/docker/tasks/install_compose.yml for devops-vm

TASK [docker : Update apt and install docker-compose-plugin] ***********************************************************************************************************************************************************************
ok: [devops-vm]

TASK [web_app : Remove Docker containers] ******************************************************************************************************************************************************************************************
changed: [devops-vm]

TASK [web_app : Remove related files] **********************************************************************************************************************************************************************************************
changed: [devops-vm]

TASK [web_app : Copy docker-compose.yml for web app] *******************************************************************************************************************************************************************************
changed: [devops-vm]

RUNNING HANDLER [web_app : Start web app container] ********************************************************************************************************************************************************************************
changed: [devops-vm]

PLAY RECAP *************************************************************************************************************************************************************************************************************************
devops-vm                  : ok=12   changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

## Playbook dynamic inventory

Yandex cloud dynamic inventory

```yaml
# inventory/yacloud_compute.yml
plugin: yacloud_compute
yacloud_token_file: .yacloud_token
```

dynamic inventory plugin stored in `plugins`

```shell
$ ansible-inventory --list
YACLOUD DYNAMIC INV
PARSE
{
    "_meta": {
        "hostvars": {
            "devops-vm": {
                "ansible_host": "130.193.48.211"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped",
            "yacloud"
        ]
    },
    "yacloud": {
        "hosts": [
            "devops-vm"
        ]
    }
}
```