## Requirements:

- my_secret_key.pem: stored secret keys access for server
- user: ubuntu

## Variables:

- `docker_container_name` : name of container

- `docker_image_name` : name of the docker image to deploy

- `internal_port` : container port

- `external_port` : host port

- `web_app_full_wipe` : flag if wipe is needed. To clean up before installing

- `web_app_full_install`: flag if full installation is needed

- `web_app_path` : path of web app. Used to create web app folder

## How to use:

```
ansible-playbook -i inventory/aws_ec2.yaml playbooks/dev/app_<<<python/typescript>>>/main.yml --diff --key-file ~/.ssh/my_secret_key.pem -e web_app_full_wipe=true
```

## Wipe:

`wiper.yml`

Wiping application. Set flag on playbook or in terminal to wipe


## Install:

`installer.yml`

Installing application. Set flag on playbook or in terminal to install


## Using healthcheck after build:

```
healthcheck:
    test:
    - CMD-SHELL
    - wget --no-verbose --tries=1 -O /dev/null http://localhost:{{ external_port }}/healthcheck || exit 1
    interval: 1m30s
    timeout: 10s
    retries: 3
    start_period: 5s
```
