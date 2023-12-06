# Description of docker role for ansible

## Overview

This role installs docker and docker-compose on a target host. It is partially based on the [ansible-role-docker](https://github.com/geerlingguy/ansible-role-docker) role by Jeff Geerling.

## Default Variables

The following variables are defined in `defaults/main.yml`, mostly there are variables for versions of docker and docker-compose,
urls for downloading docker and docker-compose, and bool variables for enabling or disabling certain features like updating of pip
or installing docker-compose.
