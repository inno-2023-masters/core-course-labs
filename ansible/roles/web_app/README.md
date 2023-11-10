## Role

Both python and typescript apps will be pulled and installed by docker image from Dockerhub. In playbooks it is possible to configure how the web app should be installed and run with following variables:

```
docker_container: - container name
docker_image: - docker image name from dockerhub
web_app_path: - web app path
internal_port: - interna, app port
external_port: - external, docker container running port
web_app_full_wipe: - flag to clean up old docker and docker containers before installing
web_app_full_install: - flag new installation
```

## Requirements

Available Docker role.

## Usage

```
- name: web_app_name
  hosts: - host
  become: yes
  remote_user: ubuntu
  roles:
    - role: 'roles/web_app'
      tags: [web_app]
      vars:
        docker_container: app_python
        docker_image: docker.io/nikolina2k/ma-repo:latest
        web_app_path: /app_python
        internal_port: 3000
        external_port: 5000
        web_app_full_wipe: true
        web_app_full_install: true
```

To run a specific role in terminal:

```
ansible-playbook -i inventory/aws_ec2.yaml playbooks/dev/<<APP NAME>>/main.yml --diff --key-file ~/.ssh/secret_key.pem
```
