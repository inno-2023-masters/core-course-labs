### ANSIBLE

<details> <summary> ansible-playbook playbooks/docker/install-docker.yml --diff </summary>

```
(venv) ➜  ansible git:(lab5) ✗ ansible-playbook playbooks/docker/install-docker.yml --diff

PLAY [Task2] *************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************
ok: [main]

TASK [docker : Install pip] **********************************************************************************************************
ok: [main]

TASK [docker : Install docker] *******************************************************************************************************
changed: [main]

TASK [docker : Install compose] ******************************************************************************************************
changed: [main]

PLAY RECAP ***************************************************************************************************************************
main                       : ok=4    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


```
</details>


<details> <summary> ansible-inventory -i inventory/default_yandex.yml  --list </summary>

```
(venv) ➜  ansible git:(lab5) ✗  ansible-inventory -i inventory/default_yandex.yml  --list     
{
    "_meta": {
        "hostvars": {
            "main": {
                "ansible_host": "51.250.29.149",
                "ansible_user": "wiirtex"
            }
        }
    },
    "all": {
        "children": [
            "ungrouped",
            "yandex"
        ]
    },
    "yandex": {
        "hosts": [
            "main"
        ]
    }
}
```

</details>

