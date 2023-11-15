# Ansible

## Best practices
* Names for plays and tasks
* Using YAML syntax
* Following the recommended structure if files and directories
* Have the secure storage for secrets

## Docker role

**_Note: run from `ansible` directory_**

Output for `ansible-playbook --ask-become-pass playbooks/dev/main.yml` command

<details>

```
BECOME password: 

PLAY [playbook] ************************************************************************************************************************************************************

TASK [docker : Install pip] ************************************************************************************************************************************************
ok: [vm]

TASK [docker : Include install_docker] *************************************************************************************************************************************
included: /ansible/roles/docker/tasks/install_docker.yml for vm

TASK [docker : Install docker] *********************************************************************************************************************************************
ok: [vm]

TASK [docker : Include install_compose] ************************************************************************************************************************************
included: /ansible/roles/docker/tasks/install_compose.yml for vm

TASK [docker : install docker-compose] *************************************************************************************************************************************
ok: [vm]

PLAY RECAP *****************************************************************************************************************************************************************
vm                         : ok=5    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

```
</details>

Output for `ansible-inventory -i inventory/default_aws_ec2.yml --list` command
<details>

```
{
    "_meta": {
        "hostvars": {
            "vm": {
                "ansible_host": "203.0.113.111",
                "ansible_user": "ubuntu"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped",
            "virtual_machines"
        ]
    },
    "virtual_machines": {
        "hosts": [
            "vm"
        ]
    }
}
```

</details>

## Dynamic Inventory

For this task I used Yandex Cloud. 
> I know that last time I used VK Cloud, however I faced
some issues with my account and still don't have access to it.
Until I resolve the issue I'll use Yandex Cloud.

Output for `ansible-playbook --ask-become-pass playbooks/dev/main.yml` command

<details>

```
BECOME password: 

PLAY [playbook] ************************************************************************************************************************************************************

TASK [docker : Install pip] ************************************************************************************************************************************************
ok: [server]

TASK [docker : Include install_docker] *************************************************************************************************************************************
included: /ansible/roles/docker/tasks/install_docker.yml for server

TASK [docker : Install docker] *********************************************************************************************************************************************
ok: [server]

TASK [docker : Include install_compose] ************************************************************************************************************************************
included: /ansible/roles/docker/tasks/install_compose.yml for server

TASK [docker : install docker-compose] *************************************************************************************************************************************
ok: [server]

PLAY RECAP *****************************************************************************************************************************************************************
server                     : ok=5    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

```
</details>

Output for ` ansible-inventory -i inventory/default_yacloud.yml --list` command

<details>

```
{
    "_meta": {
        "hostvars": {
            "server": {
                "ansible_host": "84.201.175.92",
                "ansible_ssh_private_key_file": "/path-to-your-private-key",
                "ansible_user": "liza"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped",
            "web_servers"
        ]
    },
    "web_servers": {
        "hosts": [
            "server"
        ]
    }
}

```

</details>

## Lab 6

In this lab we have default parameter `web_app_full_wipe: false` in
in `roles/web_app/defaults/main.yml` file. To enable the wipe
process write `true` instead of `false`.

### app_python

Output for `ansible-playbook --ask-become-pass playbooks/dev/app_python/main.yml` command

<details>

```
BECOME password: 

PLAY [deploy py in Docker] *************************************************************************************************************************************************

TASK [docker : Install pip] ************************************************************************************************************************************************
ok: [server]

TASK [docker : Include install_docker] *************************************************************************************************************************************
included: /ansible/roles/docker/tasks/install_docker.yml for server

TASK [docker : Install docker] *********************************************************************************************************************************************
ok: [server]

TASK [docker : Include install_compose] ************************************************************************************************************************************
included: /ansible/roles/docker/tasks/install_compose.yml for server

TASK [docker : install docker-compose] *************************************************************************************************************************************
ok: [server]

TASK [web_app : Create new dir] ********************************************************************************************************************************************
ok: [server]

TASK [web_app : Create a docker-compose.yml file] **************************************************************************************************************************
--- before
+++ after: /root/.ansible/tmp/ansible-local-96517lu1j55w/tmp70i3m57h/docker-compose.yml.j2
@@ -0,0 +1,8 @@
+version: '3.8'
+services:
+    app_python:
+        image: lizavetta/devops-python:latest
+        container_name: app_python
+        restart: unless-stopped
+        ports:
+             - "8082:80"
\ No newline at end of file

changed: [server]

TASK [web_app : Run the app using docker-compose] ********************************************************************************************************************************************
ok: [server]


TASK [web_app : Stop docker-container] *************************************************************************************************************************************
ok: [server]

TASK [web_app : Remove the application directory] **************************************************************************************************************************
--- before
+++ after
@@ -1,10 +1,4 @@
 {
     "path": "new-dir-py/",
-    "path_content": {
-        "directories": [],
-        "files": [
-            "new-dir-py/docker-compose.yml"
-        ]
-    },
-    "state": "directory"
+    "state": "absent"
 }

changed: [server]

PLAY RECAP *****************************************************************************************************************************************************************
server                     : ok=9    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

```


</details>



