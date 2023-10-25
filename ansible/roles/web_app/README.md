# Docker Role

This role deploys simple image with open ports on host

## Requirements:

- Docker role on host machine

## How to use:

```
- name: Some_name
  hosts: all
  become: true
  roles:
    - role: web_app
      image: your_image:your_tag
      ports:
        - 8000:8000
        ...
```
