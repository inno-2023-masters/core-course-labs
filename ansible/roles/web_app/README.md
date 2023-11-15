# web_app installation ansible role

This role installs docker and docker-compose on the target host.

## Supported OS

- Ubuntu 20.04

## Requirements

- docker

## Variables

- `web_app_path` - path to the web_app directory on the target host
- `web_app_image` - docker image name
- `web_app_port` - port on which web_app will be running in the container
- `web_app_command` - command to start web_app in the container
