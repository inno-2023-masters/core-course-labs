### role web_app

depends on roles:
  - docker

Deploys special version of python_time_server, specially build for linux/amd64 to the server

#### best practices
 - Tasks are grouped into blocks
 - The role explicitly depends on the role docker
 - All tasks are divided by tags: configuration, deployment and wipe
 - Wipe mechanic is implemented: just turn on flag `web_app_full_wipe` and run role with tag `wipe`
