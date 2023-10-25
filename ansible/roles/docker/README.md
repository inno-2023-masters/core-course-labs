# Docker Role

## Requirements
apt package manager on target machines.

## Variables
Docker role variables are changed in `defaults/main.yml`:
```sh
docker_compose_version: "1.29.2"
docker_version: "5.0.3"
```

## Tasks
Tasks performed for installing and deploying Docker:

- Install python
- Install pip
- Install docker
- Install docker-compose