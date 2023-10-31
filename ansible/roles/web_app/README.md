# Web app role
Ansible role to deploy a Dockerized web app

## Dependencies
Custom Docker role `docker`

## Tags:
deploy, wipe

## Config
`defaults/main.yml`
```yaml
docker_image: kernie/time-python:latest
docker_container_name: time_python
docker_port: 8000
host_port: 80
```

## Usage example
```yaml
- hosts: all
  become: true
  roles:
    - web_app
```