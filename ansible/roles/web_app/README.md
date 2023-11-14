# Ansible Role: web_app

## Description

This Ansible role is designed to deploy and manage a Dockerized web application on a target host. It includes tasks for pulling a Docker image, running a Docker container, and wiping the application if needed.

## Requirements

- Ansible installed on the control machine.
- Docker installed on the target host if you plan to use Docker containers.

## Role Variables

- `web_app_full_wipe`: A boolean variable that determines whether to wipe the existing application. Set it to `true` for a full wipe (remove containers and images) or `false` to only deploy/update the application.

## Example Playbook

Here's an example of how to use this role in an Ansible playbook:

To run a specific role in terminal: ansible-playbook -i inventory/aws_ec2.yaml ansible/playbooks/dev/main.yaml --diff --key-file ~/.ssh/my_secret_key.pem

```yaml
- name: Deploy and Manage Web Application
  hosts: localhost
  become: yes
  vars:
    web_app_full_wipe: false

  roles:
    - web_app

