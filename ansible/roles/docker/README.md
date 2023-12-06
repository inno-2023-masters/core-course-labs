Docker
=========

This role implement docker deployment on the target machines from the scratch.

Requirements
------------

The role requires target machine distro be Debian-based (as it is mentioned in meta), because it relies on `apt` package manager to install initiall `pip` dependency.

Role Variables
--------------

The role allows to specify docker and docker-compose versions to be installed

| Variable        | Required | Default |
| --------------- | -------- | ------- |
| docker_version  | no       | 24.0.5  |
| compose_version | no       | 1.29.2  |


Dependencies
------------

The role does not have external dependencies except Debian-based distro requirement.

Example Playbook
----------------

To activate the role it is enough to add the following lines into playbook.

```yml
- name: Deploy docker from scratch
  hosts: lab_hosts
  become: yes
  roles:
    - docker

```

License
-------

MIT

Author Information
------------------

Emil Latypov, e.latypov@innopolis.university
