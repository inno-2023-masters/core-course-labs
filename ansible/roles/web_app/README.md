# Web app role
Ansible role to deploy a dockerized web app.

## Requirements
Custom Docker role `docker`

## Tags:
deploy, wipe

## Config
`defaults/main.yml`
```yaml
docker_image: justsomedude22/app_python:latest
docker_container_name: app_python
docker_port: 5000
host_port: 5000
web_app_full_wipe: true
```

## Usage example
```yaml
- hosts: all
  become: true
  roles:
    - web_app
```