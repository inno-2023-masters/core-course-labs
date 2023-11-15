# Ansible

## Last 50 lines of `ansible-playbook` output

I've also added curl output after running playbook.

```bash
./playbooks/dev/main.yml -i inventory/main.yml -D
```

```bash
  libtsan0 libubsan1 libwebp7 libxpm4 linux-libc-dev lto-disabled-list make
  manpages-dev python3-dev python3-pip python3-wheel python3.10-dev
  rpcsvc-proto zlib1g-dev
0 upgraded, 64 newly installed, 0 to remove and 0 not upgraded.
changed: [devops-labs]

TASK [docker : Install Docker] ****************************************************************************************************************************************************************
ok: [devops-labs]

TASK [docker : Install Docker Compose] ********************************************************************************************************************************************************
changed: [devops-labs]

TASK [docker : Check if docker service is running] ********************************************************************************************************************************************
ok: [devops-labs]

TASK [web_app : Create app path] **************************************************************************************************************************************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/opt/web_app",
-    "state": "absent"
+    "state": "directory"
 }

changed: [devops-labs]

TASK [web_app : Render compose file] **********************************************************************************************************************************************************
--- before
+++ after: /home/platun0v/.ansible/tmp/ansible-local-514827jbl89w7/tmpbjz51odb/docker-compose.yml.j2
@@ -0,0 +1,8 @@
+services:
+  web_app:
+    hostname: web_app
+    image: docker.io/platun0v/devops-lab2:latest
+    restart: always
+    ports:
+      - "80:8000"
+    command: "gunicorn app.main:app -b 0.0.0.0:8000"
\ No newline at end of file

changed: [devops-labs]

TASK [web_app : Run docker-compose] ***********************************************************************************************************************************************************
changed: [devops-labs]

PLAY RECAP ************************************************************************************************************************************************************************************
devops-labs                : ok=9    changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

4$ ➜ curl http://192.168.0.154                                                                                                                    ~/pr/in/devops/ansible git:lab5 (1*1?1!) 1m1s
<!DOCTYPE html>
<html>
<head>
    <title>Current Time in Moscow</title>
</head>
<body>
    <h1>Current Time in Moscow:</h1>
    <p>2023-10-04 01:20:25</p>
</body>
</html>⏎
```

## Ansible inventory

```bash
4$ ➜ ansible-inventory -i inventory/main.yml --list                                                                                                    ~/pr/in/devops/ansible git:lab5 (1*1?1!)
{
    "_meta": {
        "hostvars": {
            "devops-labs": {
                "ansible_host": "192.168.0.154"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped"
        ]
    },
    "ungrouped": {
        "hosts": [
            "devops-labs"
        ]
    }
}
```
