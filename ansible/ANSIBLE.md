## Best practices:
YAML Format: Use Ansible's YAML format for clarity.
Secrets: Never store secrets
Idempotent Operations: Ensure  Ansible playbooks and roles are idempotent, meaning they can be run multiple times without causing unexpected changes or issues.
Variables: Employ variables for flexibility.


 # 1)
 ```
 pbakharuev$ ansible-playbook playbooks/dev/main.yml
 PLAY [all] *******************************************************************************************************************
 TASK [Gathering Facts] *******************************************************************************************************
 ok: [158.158.92.112]
 TASK [geerlingguy.pip : Ensure Pip is installed.] ****************************************************************************
 ok: [158.158.92.112]
 TASK [geerlingguy.pip : Ensure pip_install_packages are installed.] **********************************************************
 ok: [158.158.92.112] => (item={'name': 'docker'})
 TASK [geerlingguy.docker : Load OS-specific vars.] ***************************************************************************
 ok: [158.158.92.112]
 TASK [geerlingguy.docker : include_tasks] ************************************************************************************
 skipping: [158.158.92.112]
 TASK [geerlingguy.docker : include_tasks] ************************************************************************************
 included: /home/edikgoose/.ansible/roles/geerlingguy.docker/tasks/setup-Debian.yml for 158.158.92.112
 TASK [geerlingguy.docker : Ensure old versions of Docker are not installed.] *************************************************
 ok: [158.158.92.112]
 TASK [geerlingguy.docker : Ensure dependencies are installed.] ***************************************************************
 ok: [158.158.92.112]
 TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] **********
 skipping: [158.158.92.112]
 TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *******************************
 ok: [158.158.92.112]
 TASK [geerlingguy.docker : Add Docker apt key.] ******************************************************************************
 ok: [158.158.92.112]
 TASK [geerlingguy.docker : Ensure curl is present (on older systems without SNI).] *******************************************
 skipping: [158.158.92.112]
 TASK [geerlingguy.docker : Add Docker apt key (alternative for older systems without SNI).] **********************************
 skipping: [158.158.92.112]
 TASK [geerlingguy.docker : Add Docker repository.] ***************************************************************************
 ok: [158.158.92.112]
 TASK [geerlingguy.docker : Install Docker packages.] *************************************************************************
 skipping: [158.158.92.112]
 TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] *************************************************
 ok: [158.158.92.112]
 TASK [geerlingguy.docker : Install docker-compose plugin.] *******************************************************************
 skipping: [158.158.92.112]
 TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] *******************************************
 ok: [158.158.92.112]
 TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] ************************************************************
 skipping: [158.158.92.112]
 TASK [geerlingguy.docker : Configure Docker daemon options.] *****************************************************************
 skipping: [158.158.92.112]
 TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] ****************************************************
 ok: [158.158.92.112]
 TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] ************************************
 TASK [geerlingguy.docker : include_tasks] ************************************************************************************
 skipping: [158.158.92.112]
 TASK [geerlingguy.docker : Get docker group info using getent.] **************************************************************
 skipping: [158.158.92.112]
 TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] *****************************************
 TASK [geerlingguy.docker : include_tasks] ************************************************************************************
 skipping: [158.158.92.112]
 PLAY RECAP *******************************************************************************************************************
 158.158.92.112            : ok=13   changed=0    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0  
 ```

 Inside the VM:
 ```
 root@fhmv4skgn3aa7q3q3kmf:~# docker --version
 Docker version 24.0.6, build ed223bc
 ```


 # 2)
 ```
 pbakharuev$ ansible-playbook playbooks/dev/main.yml 
 PLAY [Install docker] ********************************************************************************************************
 TASK [Gathering Facts] *******************************************************************************************************
 ok: [158.158.92.112]
 TASK [../../roles/docker : Ensure old versions of Docker are not installed.] *************************************************
 ok: [158.158.92.112]
 TASK [../../roles/docker : include_tasks] ************************************************************************************
 included: /home/pbakharuev/devops/ansible/roles/docker/tasks/install_docker.yml for 158.158.92.112
 TASK [../../roles/docker : Install packages required by docker] **************************************************************
 ok: [158.158.92.112]
 TASK [../../roles/docker : Add docker GPG key] *******************************************************************************
 ok: [158.158.92.112]
 TASK [../../roles/docker : Add docker apt repo] ******************************************************************************
 ok: [158.158.92.112]
 TASK [../../roles/docker : Install docker] ***********************************************************************************
 ok: [158.158.92.112]
 PLAY RECAP *******************************************************************************************************************
 158.158.92.112            : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
 ```

 #### `ansible-inventory -i inventory/hosts.yml --list`:
 ```
 pbakharuev$ ansible-inventory -i inventory/hosts.yml --list
 {
     "_meta": {
         "hostvars": {
             "158.158.92.112": {
                 "private_key_file_yandex": "~/.ssh/id_ed25519-cloud",
                 "remote_user_yandex": "ubuntu"
             }
         }
     },
     "all": {
         "children": [
             "ungrouped",
             "yandexcloudvm"
         ]
     },
     "yandexcloudvm": {
         "hosts": [
             "158.158.92.112"
         ]
     }
 }
 ```