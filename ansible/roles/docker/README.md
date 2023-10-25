# Docker Role

This role installs Docker on Ubuntu 22.04 Jammy according to official tutorial

## Requirements:

- Ubuntu 22.04 on machine

## How to use:

Just use the role, no extra actions required

```
- name: Example of usage the role
  hosts: all
  become: true
  roles:
    - docker
```
