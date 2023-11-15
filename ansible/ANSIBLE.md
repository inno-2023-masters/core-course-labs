# Ansible

## Best Practices

1. Deployment-specific custom role.

2. Task division between separate files.

3. 'terraform-inventory' dynamic inventory was utilized.

4. Simple structure of Ansible part. 
   Common ansible features, appropriate file names and etc. makes the code easier to read.

## Ansible Output

```
$ ansible-playbook playbooks/dev/main.yaml --diff

PLAY [Docker deployment using the Ansible role] ******************************************************

TASK [Gathering Facts] **********************************************************************
ok: [vm01]

TASK [docker : include_tasks] ***************************************************************
included: /mnt/c/Users/Владимир/Desktop/Inno/devops/devops-course-labs/ansible/roles/docker/tasks/pip_task.yml for vm01

TASK [docker : Update cache] ******************************************************************
changed: [vm01]

TASK [docker : Python3 and python3-pip installation] ******************************************************
The following additional packages will be installed:
  python3-wheel
Recommended packages:
  build-essential python3-dev
The following NEW packages will be installed:
  python3-pip python3-wheel
0 upgraded, 2 newly installed, 0 to remove and 214 not upgraded.
changed: [vm01]

TASK [docker : include_tasks] ***************************************************************
included: /mnt/c/Users/Владимир/Desktop/Inno/devops/devops-course-labs/ansible/roles/docker/tasks/docker_task.yml for vm01

TASK [docker : Docker installation] **************************************************************
changed: [vm01]

TASK [docker : include_tasks] ***************************************************************
included: /mnt/c/Users/Владимир/Desktop/Inno/devops/devops-course-labs/ansible/roles/docker/tasks/compose_task.yml for vm01

TASK [docker : Docker-compose installation] ******************************************************
changed: [vm01]

PLAY RECAP **********************************************************************************
vm01                       : ok=8    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```

## Inventory Output

```
$ ansible-inventory -i inventory/inventory.yaml --list

{
    "_meta": {
        "hostvars": {
            "vm01": {
                "ansible_host": "212.233.94.135"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped",
            "virtualmachines"
        ]
    },
    "virtualmachines": {
        "hosts": [
            "vm01"
        ]
    }
}

```

## Dynamic Inventory Details
'inventory_dynamic.sh' bash script was created to represent dynamic inventory fucntionality.
This tool was used to obtain the virtual machine info and apply it to Ansible.

## Web App Deployment Output

**Python:** 

```
$ ansible-playbook playbooks/dev/app_python/main.yaml --diff

PLAY [Docker python app deployment using the Ansible role] *********************************************

TASK [Gathering Facts] ************************************************************************
ok: [vm01]

TASK [docker : Update apt] ********************************************************************
changed: [vm01]

TASK [docker : Python3 and python3-pip installation] ********************************************************
ok: [vm01]

TASK [docker : Update cache] ******************************************************************
changed: [vm01]

TASK [docker : Dependencies installation] **********************************************************
ok: [vm01]

TASK [docker : Apt key initialization] *******************************************************************
changed: [vm01]

TASK [docker : Repository initialization] ****************************************************************
--- before: /dev/null
+++ after: /etc/apt/sources.list.d/download_docker_com_linux_ubuntu.list
@@ -0,0 +1 @@
+deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable

changed: [vm01]

TASK [docker : Docker installation] ****************************************************************
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
Recommended packages:
  libltdl7 pigz docker-buildx-plugin docker-compose-plugin slirp4netns
The following NEW packages will be installed:
  containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
0 upgraded, 4 newly installed, 0 to remove and 104 not upgraded.
changed: [vm01]

TASK [docker : Docker-compose installation] ********************************************************
ok: [vm01]

TASK [web_app : Docker-compose check] ******************************************
ok: [vm01]

TASK [web_app : Directory check] ********************************************
ok: [vm01]

TASK [web_app : Containers remove] *****************************************************
changed: [vm01]

TASK [web_app : Directory delete] *********************************************
--- before
+++ after
@@ -1,10 +1,4 @@
 {
     "path": "/app_python",
-    "path_content": {
-        "directories": [],
-        "files": [
-            "/app_python/docker-compose.yml"
-        ]
-    },
-    "state": "directory"
+    "state": "absent"
 }

changed: [vm01]

TASK [web_app : Directory creation] *************************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/app_python",
-    "state": "absent"
+    "state": "directory"
 }

changed: [vm01]

TASK [web_app : Docker-compose creation] ***************************************************
--- before
+++ after: /home/vladimirzelenokor/.ansible/tmp/ansible-local-847mb2n45aa/tmpnmh4l5hf/docker-compose.yml.j2
@@ -0,0 +1,9 @@
+version: '3.9'
+
+services:
+  web_app_python:
+    image: vladimirzelenokor/devops-python-app
+    container_name: devops-python-app
+    ports:
+      - 5000:8000
+    restart: always
\ No newline at end of file

changed: [vm01]

RUNNING HANDLER [web_app : Docker-Compose run] ************************************************
changed: [vm01]

PLAY RECAP ************************************************************************************
vm01                       : ok=16   changed=10   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```