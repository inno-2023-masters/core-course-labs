
## Custom docker role
My docker role contains of two steps:
1. Install the docker via pip
2. Install the docker-compose via pip

#### Requirements:
The docker role uses ansible built-in pip (`ansible.builtin.pip`), so the only requirement is ansible itself:

`pip install ansible`


### Usage
To utilize docker role it is enough to mention it in the playbook file as:
```yaml
roles:
    - { role: docker, become: yes }
```

Note: make sure your `ansible.cfg` contains correct `role_path` specification.

For example, it could be `roles_path=:/roles` if the ansible-playbook runs from `ansible/` directory 