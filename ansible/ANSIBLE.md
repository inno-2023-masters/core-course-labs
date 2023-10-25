# Docker role

Latest 50 lines of plybook which just installs Docker

```
dmpru@dmpru:/mnt/g/git/core-course-labs/ansible$ ansible-playbook main.yaml -i ./inventory/inventory.yaml --diff
[WARNING]: Ansible is being run in a world writable directory
(/mnt/g/git/core-course-labs/ansible), ignoring it as an ansible.cfg
source. For more information see
https://docs.ansible.com/ansible/devel/reference_appendices/config.html#cfg-in-
world-writable-dir
[DEPRECATION WARNING]: "include" is deprecated, use include_tasks/import_tasks
instead. See https://docs.ansible.com/ansible-
core/2.15/user_guide/playbooks_reuse_includes.html for details. This feature
will be removed in version 2.16. Deprecation warnings can be disabled by
setting deprecation_warnings=False in ansible.cfg.

PLAY [VK Cloud config] *********************************************************

TASK [Gathering Facts] *********************************************************
ok: [ubuntu@212.233.94.42]

TASK [docker : include_tasks] **************************************************
included: /mnt/g/git/core-course-labs/ansible/roles/docker/tasks/deps.yaml for ubuntu@212.233.94.42

TASK [docker : Chekc to have needable deps.] ***********************************
The following additional packages will be installed:
  python3-wheel
Recommended packages:
  build-essential python3-dev
The following NEW packages will be installed:
  python3-pip python3-wheel
0 upgraded, 2 newly installed, 0 to remove and 0 not upgraded.
changed: [ubuntu@212.233.94.42]

TASK [docker : include_tasks] **************************************************
included: /mnt/g/git/core-course-labs/ansible/roles/docker/tasks/repo.yaml for ubuntu@212.233.94.42

TASK [docker : Install keys] ***************************************************
changed: [ubuntu@212.233.94.42]

TASK [docker : Add docker repo] ************************************************
--- before: /dev/null
+++ after: /etc/apt/sources.list.d/docker.list
@@ -0,0 +1 @@
+deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/docker.asc] https://download.docker.com/linux/ubuntu jammy stable

changed: [ubuntu@212.233.94.42]

TASK [docker : include_tasks] **************************************************
included: /mnt/g/git/core-course-labs/ansible/roles/docker/tasks/install.yaml for ubuntu@212.233.94.42

TASK [docker : Check to not have old deps] *************************************
ok: [ubuntu@212.233.94.42]

TASK [docker : Install docker] *************************************************
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
Recommended packages:
  docker-ce-rootless-extras libltdl7 pigz docker-compose-plugin
The following NEW packages will be installed:
  containerd.io docker-buildx-plugin docker-ce docker-ce-cli
0 upgraded, 4 newly installed, 0 to remove and 216 not upgraded.
changed: [ubuntu@212.233.94.42]

TASK [docker : Install pip packets] ********************************************
changed: [ubuntu@212.233.94.42]
TASK [py_app : Check if docker is present.] ************************************
The following additional packages will be installed:
  wmdocker
The following NEW packages will be installed:
  docker wmdocker
0 upgraded, 2 newly installed, 0 to remove and 216 not upgraded.
changed: [ubuntu@212.233.94.42]

TASK [py_app : Run python app] *************************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
-    "exists": false,
-    "running": false
+    "exists": true,
+    "running": true
 }

changed: [ubuntu@212.233.94.42]

PLAY RECAP *********************************************************************
ubuntu@212.233.94.42       : ok=12   changed=7    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

## Inventory

```
{
    "_meta": {
        "hostvars": {
            "ubuntu@212.233.94.42": {
                "ansible_ssh_private_key_file": "~/.ssh/id_rsa",
                "ansible_user": "ubuntu"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped",
            "vk_cloud"
        ]
    },
    "vk_cloud": {
        "children": [
            "type_vkcs_compute_floatingip_associate"
        ],
        "hosts": [
            "ubuntu@212.233.94.42"
        ]
    }
}
```

## Docker web app deploy

```
dmpru@dmpru:/mnt/g/git/core-course-labs/ansible$ ansible-playbook main.yaml -i ./inventory/inventory.yaml --diff
[WARNING]: Ansible is being run in a world writable directory (/mnt/g/git/core-course-labs/ansible),
ignoring it as an ansible.cfg source. For more information see
https://docs.ansible.com/ansible/devel/reference_appendices/config.html#cfg-in-world-writable-dir

PLAY [Deploy python app to host] ******************************************************************************

TASK [Gathering Facts] ****************************************************************************************
ok: [ubuntu@87.239.106.11]

TASK [docker : include_tasks] *********************************************************************************
included: /mnt/g/git/core-course-labs/ansible/roles/docker/tasks/deps.yaml for ubuntu@87.239.106.11

TASK [docker : Chekc to have needable deps.] ******************************************************************
The following additional packages will be installed:
  python3-wheel
Recommended packages:
  build-essential python3-dev
The following NEW packages will be installed:
  python3-pip python3-wheel
0 upgraded, 2 newly installed, 0 to remove and 0 not upgraded.
changed: [ubuntu@87.239.106.11]

TASK [docker : include_tasks] *********************************************************************************
included: /mnt/g/git/core-course-labs/ansible/roles/docker/tasks/repo.yaml for ubuntu@87.239.106.11

TASK [docker : Install keys] **********************************************************************************
changed: [ubuntu@87.239.106.11]

TASK [docker : Add docker repo] *******************************************************************************
--- before: /dev/null
+++ after: /etc/apt/sources.list.d/docker.list
@@ -0,0 +1 @@
+deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/docker.asc] https://download.docker.com/linux/ubuntu jammy stable

changed: [ubuntu@87.239.106.11]

TASK [docker : include_tasks] *********************************************************************************
included: /mnt/g/git/core-course-labs/ansible/roles/docker/tasks/install.yaml for ubuntu@87.239.106.11

TASK [docker : Check to not have old deps] ********************************************************************
ok: [ubuntu@87.239.106.11]

TASK [docker : Install docker] ********************************************************************************
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
Recommended packages:
  docker-ce-rootless-extras libltdl7 pigz docker-compose-plugin
The following NEW packages will be installed:
  containerd.io docker-buildx-plugin docker-ce docker-ce-cli
0 upgraded, 4 newly installed, 0 to remove and 216 not upgraded.
changed: [ubuntu@87.239.106.11]

TASK [docker : Install pip packets] ***************************************************************************
changed: [ubuntu@87.239.106.11]

TASK [web_app : Install application] **************************************************************************
included: /mnt/g/git/core-course-labs/ansible/roles/web_app/tasks/run.yaml for ubuntu@87.239.106.11

TASK [web_app : Create a directory if it does not exist] ******************************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/opt/composes/dmitriypru/core_course_labs_python:latest",
-    "state": "absent"
+    "state": "directory"
 }

changed: [ubuntu@87.239.106.11]

TASK [web_app : Create docker-compose] ************************************************************************
--- before
+++ after: /home/dmpru/.ansible/tmp/ansible-local-933o_pkb40o/tmprgwnjjnu/docker-compose.yml.j2
@@ -0,0 +1,6 @@
+version: "3"
+services:
+  app:
+    image: dmitriypru/core_course_labs_python:latest
+    ports:
+      - "8000:8000"

changed: [ubuntu@87.239.106.11]

TASK [web_app : Run application] ******************************************************************************
changed: [ubuntu@87.239.106.11]

TASK [web_app : Wipe appliction] ******************************************************************************
skipping: [ubuntu@87.239.106.11]

PLAY [Deploy C# app to host] **********************************************************************************

TASK [Gathering Facts] ****************************************************************************************
ok: [ubuntu@87.239.106.11]

TASK [docker : include_tasks] *********************************************************************************
included: /mnt/g/git/core-course-labs/ansible/roles/docker/tasks/deps.yaml for ubuntu@87.239.106.11

TASK [docker : Chekc to have needable deps.] ******************************************************************
ok: [ubuntu@87.239.106.11]

TASK [docker : include_tasks] *********************************************************************************
included: /mnt/g/git/core-course-labs/ansible/roles/docker/tasks/repo.yaml for ubuntu@87.239.106.11

TASK [docker : Install keys] **********************************************************************************
ok: [ubuntu@87.239.106.11]

TASK [docker : Add docker repo] *******************************************************************************
ok: [ubuntu@87.239.106.11]

TASK [docker : include_tasks] *********************************************************************************
included: /mnt/g/git/core-course-labs/ansible/roles/docker/tasks/install.yaml for ubuntu@87.239.106.11

TASK [docker : Check to not have old deps] ********************************************************************
ok: [ubuntu@87.239.106.11]

TASK [docker : Install docker] ********************************************************************************
ok: [ubuntu@87.239.106.11]

TASK [docker : Install pip packets] ***************************************************************************
ok: [ubuntu@87.239.106.11]

TASK [web_app : Install application] **************************************************************************
included: /mnt/g/git/core-course-labs/ansible/roles/web_app/tasks/run.yaml for ubuntu@87.239.106.11

TASK [web_app : Create a directory if it does not exist] ******************************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/opt/composes/dmitriypru/core_course_labs_csharp:latest",
-    "state": "absent"
+    "state": "directory"
 }

changed: [ubuntu@87.239.106.11]

TASK [web_app : Create docker-compose] ************************************************************************
--- before
+++ after: /home/dmpru/.ansible/tmp/ansible-local-933o_pkb40o/tmpadejy6di/docker-compose.yml.j2
@@ -0,0 +1,6 @@
+version: "3"
+services:
+  app:
+    image: dmitriypru/core_course_labs_csharp:latest
+    ports:
+      - "80:80"

changed: [ubuntu@87.239.106.11]

TASK [web_app : Run application] ******************************************************************************
changed: [ubuntu@87.239.106.11]

TASK [web_app : Wipe appliction] ******************************************************************************
skipping: [ubuntu@87.239.106.11]

PLAY RECAP ****************************************************************************************************
ubuntu@87.239.106.11       : ok=28   changed=11   unreachable=0    failed=0    skipped=2    rescued=0    ignored=0
```
