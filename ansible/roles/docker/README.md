# Docker Role
This role installs pip and Docker.

## Requirements
> Ubuntu 22.04

## How to use

Here's an example of the playbook for the Docker role

```yaml
- name: playbook
  gather_facts: no
  hosts: all
  connection: local
  become: true
  roles:
    - docker
```
