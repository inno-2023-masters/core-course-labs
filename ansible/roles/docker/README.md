## Docker Role
It installs pip, Docker and Docker-compose
```angular2html
- include_tasks: install_pip.yml
- include_tasks: install_docker.yml
- include_tasks: install_compose.yml
```

## Requirements 
Linux OS

## Usage
Add docker role into playbook