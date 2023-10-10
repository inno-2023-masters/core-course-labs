muurrk@muurrk-PS42-8M:~/core-course-labs/ansible$ ansible-playbook -i inventory/inventory.ini --private-key ~/.ssh/DevOpsLab.pem playbooks/dev/main.yaml

PLAY [Configure Docker] ************************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************************
ok: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Load OS-specific vars.] *********************************************************************************************************************************
ok: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : include_tasks] ******************************************************************************************************************************************
skipping: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : include_tasks] ******************************************************************************************************************************************
included: /home/muurrk/.ansible/roles/geerlingguy.docker/tasks/setup-Debian.yml for ubuntu@37.139.32.36

TASK [geerlingguy.docker : Ensure old versions of Docker are not installed.] *******************************************************************************************************
ok: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Ensure dependencies are installed.] *********************************************************************************************************************
ok: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu < 20.04 and any other systems).] ****************************************************************
skipping: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Ensure additional dependencies are installed (on Ubuntu >= 20.04).] *************************************************************************************
ok: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Add Docker apt key.] ************************************************************************************************************************************
changed: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Ensure curl is present (on older systems without SNI).] *************************************************************************************************
skipping: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Add Docker apt key (alternative for older systems without SNI).] ****************************************************************************************
skipping: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Add Docker repository.] *********************************************************************************************************************************
changed: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Install Docker packages.] *******************************************************************************************************************************
skipping: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Install Docker packages (with downgrade option).] *******************************************************************************************************
changed: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Install docker-compose plugin.] *************************************************************************************************************************
skipping: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Install docker-compose-plugin (with downgrade option).] *************************************************************************************************
changed: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Ensure /etc/docker/ directory exists.] ******************************************************************************************************************
skipping: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Configure Docker daemon options.] ***********************************************************************************************************************
skipping: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Ensure Docker is started and enabled at boot.] **********************************************************************************************************
ok: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Ensure handlers are notified now to avoid firewall conflicts.] ******************************************************************************************

RUNNING HANDLER [geerlingguy.docker : restart docker] ******************************************************************************************************************************
changed: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : include_tasks] ******************************************************************************************************************************************
skipping: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Get docker group info using getent.] ********************************************************************************************************************
skipping: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : Check if there are any users to add to the docker group.] ***********************************************************************************************
skipping: [ubuntu@37.139.32.36]

TASK [geerlingguy.docker : include_tasks] ******************************************************************************************************************************************
skipping: [ubuntu@37.139.32.36]

PLAY RECAP *************************************************************************************************************************************************************************
ubuntu@37.139.32.36        : ok=12   changed=5    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0   

