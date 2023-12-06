## Web App Role

Use this role for deploying web app using docker compose

### Dependencies

Role uses `docker` role as dependency for installing pip, docker-compose and so on.

### Requirements

Before usage setup next variables:
```
docker_container
docker_image_name
docker_image_version

internal_port
external_port

web_app_full_wipe: <true/false>
web_app_name
```

### Usage 

Add role `web_app` to playbook and run `ansible-playbook <path to playbook>`