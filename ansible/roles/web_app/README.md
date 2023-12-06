# Role for deploying web application using docker

## Dependencies

This role depends an a `docker` role, made on a previous lab.

## Example Playbook

```yaml
- name : Deploy web application
  hosts: all
  become_method: sudo
  become: yes
  roles:
    - docker
```
