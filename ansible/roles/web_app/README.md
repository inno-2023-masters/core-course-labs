## Web app role

Role installs web application with the given docker image, loads this image into the specific host.

## Usage

```
- name: Name of example of the docker image usage
  hosts: all
  become: true
  roles:
    - role: web_app
      image: ubuntu:latest
      ports:
        - 2000:3000
```
