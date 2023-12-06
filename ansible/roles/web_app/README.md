# Ansible Role: Moscow Time Display Application

An Ansible Role that installs and runs **iskanred/app_python** image. With changing variables values it is possible to deploy any simple docker web application.

---

## Requirements

* Ansible `community.docker.docker_container` module. It is included in standard `ansible` package but not `ansible-core`.
* Other modules are included in `ansible core`.
---

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

```yaml
app_name: app_python
docker_image_name: iskanred/app_python
docker_image_version: 1.0.0
docker_container_name: app_python_container
internal_port: 8080
external_port: 8080

docker_image: "{{ docker_image_name }}:{{ docker_image_version }}"
app_dir: "/{{ app_name }}"
docker_compose_filepath: "{{ app_dir }}/docker-compose.yml"

# Enable if stopping application is necessary before start
web_app_full_stop: true
# Enable if wiping application files is necessary before start
web_app_full_wipe: true

# Either `docker` or `compose` value
web_app_deployment_way: "docker"
```

* `app_name`: just name of app, can be any
* `docker_image_name`: name of docker image to deploy
* `docker_image_version`: docker image tag
* `docker_container_name`: name of container on host machine
* `internal_port`: application's port inside docker container
* `external_port`: application's port on host machine
* `docker_image`: full docker image name (`name:tag`)
* `app_dir`: application's working directory on host machine
* `docker_compose_filepath`: path to docker-compose file
* `web_app_full_stop`: flag that represents stopping container before start.
* `web_app_full_wipe`: flag that represents wiping all application data (containers, files, images) before start.
* `web_app_deployment_way`: necessary to select the way of deploy. Possible values: `docker`, `compose`. The details are [below](#deployment-method). The value of variable must be presented explicitly!

### Deployment method
There are two ways of deployment:
1. Using just **Docker**.
2. Using **Docker-Compose**.

The method of choosing the way is regulated by changing the variable `web_app_deployment_way` with values:
1. `docker` for **Docker**.
2. `compose` for **Docker-Compose**.

The value of the variable will be checked before running deployment or any other action using [tags](#tags).

---

## Tags
There are different tags for tasks:
* `check-flags`: check that all necessary variable values are presented (`web_app_deployment_way`).
* `deploy-app`: only deploy application without stopping and wiping (`check-flags` is still executed).
* `stop-app`: only stop application's container (`check-flags` is still executed). Note that it will not work if variable `web_app_full_stop` is set to `false`.
* `wipe-app`: only wipe application's data (`check-flags` is still executed). Note that it will not work if variable `web_app_full_wipe` is set to `false`.

---

## Dependencies

* Role `docker` from `/ansible/roles/docker/`.
---

## Example Playbook

```yml
- name: Deploy Python Application
  hosts: all
  become: true
  roles:
    - name: web_app
```

Also, more informative and useful example you can find in 
`/ansible/playbooks/dev/app_python.yml` or in
`/ansible/playbooks/dev/app_kotlin.yml`.

## Author Information

This role was created in 2023 by **Iskander Nafikov**, Innopolis University student.

Contact: [i.nafikov@innopolis.university](mailto:i.nafikov@innopolis.university)
