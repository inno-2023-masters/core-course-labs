# Ansible

## Details
Amazon EC2 is used as host machine. To connect to it, the key is used. Path to key is specified in the Ansible configuration file.

Inventory contains AWS hosts to connect to. Note that I would usually try and hide this IP, but for the sake of this assignment, I will not.

Playbook launches Docker deployment.

Roles includes a docker role for installing prerequisites and configuring Docker on the VM.


## Deployment Output

```sh
ansible-playbook playbooks/dev/main.yaml
```

```sh
PLAY [Deploy Docker] ************************************************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************************************
ok: [aws01]

TASK [docker : Install python] *****************************************************************************************************************************************************************
included: /home/ubuntu/core-course-labs/ansible/roles/docker/tasks/install_python.yml for aws01

TASK [docker : Update apt] ******************************************************************************************************************************************************************
changed: [aws01]

TASK [docker : Install python] **************************************************************************************************************************************************************
ok: [aws01]

TASK [docker : Install pip] *****************************************************************************************************************************************************************
included: /home/ubuntu/core-course-labs/ansible/roles/docker/tasks/install_pip.yml for aws01

TASK [docker : Install pip] *****************************************************************************************************************************************************************
ok: [aws01]

TASK [docker : Install docker] **************************************************************************************************************************************************************
included: /home/ubuntu/core-course-labs/ansible/roles/docker/tasks/install_docker.yml for aws01

TASK [docker : Install docker] **************************************************************************************************************************************************************
ok: [aws01]

TASK [docker : Install docker-compose] ******************************************************************************************************************************************************
included: /home/ubuntu/core-course-labs/ansible/roles/docker/tasks/install_compose.yml for aws01

TASK [docker : Install docker-compose] ******************************************************************************************************************************************************
changed: [aws01]

TASK [web_app : Remove docker containers] ******************************************************************************************************************************************************************************************
changed: [aws01]

TASK [web_app : Remove leftover files] **********************************************************************************************************************************************************************************************
changed: [aws01]

changed: [devops-vm]

RUNNING HANDLER [web_app : Start web app container] ********************************************************************************************************************************************************************************
changed: [aws01]

PLAY RECAP **********************************************************************************************************************************************************************************
aws01                       : ok=12   changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

## Inventory details
```sh
ansible-inventory -i inventory/default.yml --list
```

```sh
{
    "_meta": {
        "hostvars": {
            "aws01": {
                "ansible_host": "18.212.49.89"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped",
            "aws_hosts"
        ]
    },
    "aws_hosts": {
        "hosts": [
            "aws01"
        ]
    }
}
```