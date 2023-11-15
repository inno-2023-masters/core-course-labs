# Web App role

This role installs the needed web application.

## Requirements
> Ubuntu 22.04

Configured values in `/defaults/main.yml`
```yaml
---
docker_compose_directory: "{{ app_name }}/docker-compose"
web_app_full_wipe: false
```

## How to use

Here's an example of the playbook for the `web_app` role

```yaml
- name: webapp
  gather_facts: no
  hosts: all
  connection: local
  become: true
  roles:
    - web_app
```