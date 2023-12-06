# Ansible overview

## Lab 5

### Task 1

Here I just used a role which was suggested with a local playbook and inventory file. So, I connected to my local virtual machine via ssh and run the playbook.


```bash

sudo ansible-playbook playbooks/dev/main.yml --ask-become-pass 

```

Result:

```bash
BECOME password: 

PLAY [Prepare docker] **************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************
ok: [virtual_machine_1]

TASK [geerlingguy.docker : Load OS-specific vars.] *********************************************************************************************
ok: [virtual_machine_1]

TASK [geerlingguy.docker : include_tasks] ******************************************************************************************************
skipping: [virtual_machine_1]

TASK [geerlingguy.docker : include_tasks] ******************************************************************************************************
included: /Users/max/uni/DevOpsF23/ansible/roles/geerlingguy.docker/tasks/setup-Debian.yml for virtual_machine_1

TASK [geerlingguy.docker : Ensure old versions of Docker are not installed.] *******************************************************************
ok: [virtual_machine_1]

TASK [geerlingguy.docker : Ensure dependencies are installed.] *********************************************************************************
ok: [virtual_machine_1]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ****************************
skipping: [virtual_machine_1]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *************************************************
ok: [virtual_machine_1]

TASK [geerlingguy.docker : Add Docker apt key.] ************************************************************************************************
ok: [virtual_machine_1]

TASK [geerlingguy.docker : Ensure curl is present (on older systems without SNI).] *************************************************************
skipping: [virtual_machine_1]

TASK [geerlingguy.docker : Add Docker apt key (alternative for older systems without SNI).] ****************************************************
skipping: [virtual_machine_1]

TASK [geerlingguy.docker : Add Docker repository.] *********************************************************************************************
ok: [virtual_machine_1]

TASK [geerlingguy.docker : Install Docker packages.] *******************************************************************************************
skipping: [virtual_machine_1]

TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] *******************************************************************
changed: [virtual_machine_1]

TASK [geerlingguy.docker : Install docker-compose plugin.] *************************************************************************************
skipping: [virtual_machine_1]

TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] *************************************************************
ok: [virtual_machine_1]

TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] ******************************************************************************
skipping: [virtual_machine_1]

TASK [geerlingguy.docker : Configure Docker daemon options.] ***********************************************************************************
skipping: [virtual_machine_1]

TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] **********************************************************************
ok: [virtual_machine_1]

TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] ******************************************************

RUNNING HANDLER [geerlingguy.docker : restart docker] ******************************************************************************************
changed: [virtual_machine_1]

TASK [geerlingguy.docker : include_tasks] ******************************************************************************************************
skipping: [virtual_machine_1]

TASK [geerlingguy.docker : Get docker group info using getent.] ********************************************************************************
skipping: [virtual_machine_1]

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ***********************************************************
skipping: [virtual_machine_1]

TASK [geerlingguy.docker : include_tasks] ******************************************************************************************************
skipping: [virtual_machine_1]

PLAY RECAP *************************************************************************************************************************************
virtual_machine_1          : ok=12   changed=2    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0 
```

### Results of task 2

```bash

sudo ansible-playbook playbooks/docker/main.yml --ask-become-pass -i inventory/default.yml -
-diff

```

```bash

BECOME password: 

PLAY [Docker delploy] **************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************
ok: [virtual_machine_1]

TASK [docker : Install pip] ********************************************************************************************************************
ok: [virtual_machine_1]

TASK [docker : Update pip] *********************************************************************************************************************
ok: [virtual_machine_1]

TASK [docker : include_tasks] ******************************************************************************************************************
included: /Users/max/uni/DevOpsF23/ansible/roles/docker/tasks/install_docker.yml for virtual_machine_1

TASK [docker : Docker packages] ****************************************************************************************************************
ok: [virtual_machine_1]

TASK [docker : Docker GPG key] *****************************************************************************************************************
ok: [virtual_machine_1]

TASK [docker : Doceker repository] *************************************************************************************************************
ok: [virtual_machine_1]

TASK [docker : Docker python module] ***********************************************************************************************************
ok: [virtual_machine_1]

TASK [docker : include_tasks] ******************************************************************************************************************
included: /Users/max/uni/DevOpsF23/ansible/roles/docker/tasks/install_compose.yml for virtual_machine_1

TASK [docker : Install docker-compose] *********************************************************************************************************
ok: [virtual_machine_1]

PLAY RECAP *************************************************************************************************************************************
virtual_machine_1          : ok=10   changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```

## Lab 6

sudo ansible-playbook playbooks/web_app/main.yml --ask-become-pass -i inventory/default.yml -
-diff

Web_app role - Role for deploying web application using docker. There are variables for setting a docker image name, docker user and wipe option.

### Results

Running a command provides the following results:

```bash
   PLAY [Deploy web app] ********************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************
ok: [virtual_machine_1]

TASK [docker : Install pip] **************************************************************************************************************************
ok: [virtual_machine_1]

TASK [docker : Update pip] ***************************************************************************************************************************
ok: [virtual_machine_1]

TASK [docker : include_tasks] ************************************************************************************************************************
included: /Users/max/uni/DevOpsF23/ansible/roles/docker/tasks/install_docker.yml for virtual_machine_1

TASK [docker : Docker packages] **********************************************************************************************************************
ok: [virtual_machine_1]

TASK [docker : Docker GPG key] ***********************************************************************************************************************
ok: [virtual_machine_1]

TASK [docker : Doceker repository] *******************************************************************************************************************
ok: [virtual_machine_1]

TASK [docker : Docker python module] *****************************************************************************************************************
ok: [virtual_machine_1]

TASK [docker : include_tasks] ************************************************************************************************************************
included: /Users/max/uni/DevOpsF23/ansible/roles/docker/tasks/install_compose.yml for virtual_machine_1

TASK [docker : Install docker-compose] ***************************************************************************************************************
ok: [virtual_machine_1]

TASK [web_app : Pull image] **************************************************************************************************************************
skipping: [virtual_machine_1]

TASK [web_app : Deploy container] ********************************************************************************************************************
skipping: [virtual_machine_1]

TASK [web_app : Add docker-compose] ******************************************************************************************************************
ok: [virtual_machine_1]

TASK [web_app : Stop all containers] *****************************************************************************************************************
skipping: [virtual_machine_1]

TASK [web_app : Remove all containers] ***************************************************************************************************************
skipping: [virtual_machine_1]

TASK [web_app : Remove all images] *******************************************************************************************************************
skipping: [virtual_machine_1]

TASK [web_app : Remove all compose elements] *********************************************************************************************************
skipping: [virtual_machine_1]

PLAY RECAP *******************************************************************************************************************************************
virtual_machine_1          : ok=11   changed=0    unreachable=0    failed=0    skipped=6    rescued=0    ignored=0   

```
