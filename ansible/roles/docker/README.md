# Ansible Role: Python Docker & Docker Compose

An Ansible Role that installs **Docker** & **Docker Compose** on **Linux** (*Debian* / *Ubuntu*) using corresponding **Python** modules.

---

## Requirements

`apt` package manager must be pre-installed on the host machine. Since it is pre-installed on *Debian* / *Ubuntu* distributive you can use it from scratch on such systems.

---

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

```yaml
pip_docker_version: "6.1.3"
pip_docker_compose_version: "1.29.2"
```

These variables allow to control the versions of **Docker** and **Docker Compose** Python modules, respectively.

---

## Dependencies

It is a requirement to have this dependency:
* `apt` package manager

If there are no such dependencies, they will be installed:
* `pyhton3` from `apt` repository
* `python3-pip` from `apt` repository

---

## Example Playbook

```yml
- hosts: all
  roles:
    - docker
```
Also, more informative and useful example you can find in `/ansible/playbooks/dev/main.yml`.

## Author Information

This role was created in 2023 by **Iskander Nafikov**, Innopolis University student.

Contact: [i.nafikov@innopolis.university](mailto:i.nafikov@innopolis.university)
