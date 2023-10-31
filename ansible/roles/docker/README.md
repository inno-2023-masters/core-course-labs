# Docker role

This role installs latest Docker and Docker Compose on linux hosts.

## Requirements

Configure the following variables in `defaults/main.yml`:

```yaml
# Enable docker service management and restart handler
docker_service_manage: true
docker_restart_handler_state: restarted

# Install docker compose plugin or not
docker_install_compose_plugin: true
docker_compose_package: docker-compose-plugin
```

## Usage example
```yaml
- hosts: all
  become: true
  roles:
    - docker
```
