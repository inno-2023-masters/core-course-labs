## Important: learn-terraform-aws-instance folder was removed as it was larger than 100MB^ which is not possible to push to Github.

## Output of `terraform state show 'docker_container.nginx'`

    #docker_container.nginx:
    resource "docker_container" "nginx" {
        attach                                      = false
        command                                     = [
            "nginx",
            "-g",
            "daemon off;",
        ]
        container_read_refresh_timeout_milliseconds = 15000
        cpu_shares                                  = 0
        entrypoint                                  = [
            "/docker-entrypoint.sh",
        ]
        env                                         = []
        hostname                                    = "19b7b77e2d15"
        id                                          = "19b7b77e2d15206e497fa166b37b50d881b39f2b4c9915b49a7962362c81c83e"
        image                                       = "sha256:2a4fbb36e96607b16e5af2e24dc6a1025a4795520c98c6b9ead9c4113617cb73"
        init                                        = false
        ipc_mode                                    = "private"
        log_driver                                  = "json-file"
        logs                                        = false
        max_retry_count                             = 0
        memory                                      = 0
        memory_swap                                 = 0
        must_run                                    = true
        name                                        = "tutorial"
        network_data                                = [
            {
                gateway                   = "172.17.0.1"
                global_ipv6_address       = ""
                global_ipv6_prefix_length = 0
                ip_address                = "172.17.0.2"
                ip_prefix_length          = 16
                ipv6_gateway              = ""
                mac_address               = "02:42:ac:11:00:02"
                network_name              = "bridge"
            },
        ]
        network_mode                                = "default"
        privileged                                  = false
        publish_all_ports                           = false
        read_only                                   = false
        remove_volumes                              = true
        restart                                     = "no"
        rm                                          = false
        runtime                                     = "runc"
        security_opts                               = []
        shm_size                                    = 64
        start                                       = true
        stdin_open                                  = false
        stop_signal                                 = "SIGQUIT"
        stop_timeout                                = 0
        tty                                         = false
        wait                                        = false
        wait_timeout                                = 60

        ports {
            external = 8000
            internal = 80
            ip       = "0.0.0.0"
            protocol = "tcp"
        }
    }

## Output of `terraform state show 'docker_image.nginx'`

    # docker_container.nginx:
    resource "docker_container" "nginx" {
        attach                                      = false
        command                                     = [
            "nginx",
            "-g",
            "daemon off;",
        ]
        container_read_refresh_timeout_milliseconds = 15000
        cpu_shares                                  = 0
        entrypoint                                  = [
            "/docker-entrypoint.sh",
        ]
        env                                         = []
        hostname                                    = "19b7b77e2d15"
        id                                          = "19b7b77e2d15206e497fa166b37b50d881b39f2b4c9915b49a7962362c81c83e"
        image                                       = "sha256:2a4fbb36e96607b16e5af2e24dc6a1025a4795520c98c6b9ead9c4113617cb73"
        init                                        = false
        ipc_mode                                    = "private"
        log_driver                                  = "json-file"
        logs                                        = false
        max_retry_count                             = 0
        memory                                      = 0
        memory_swap                                 = 0
        must_run                                    = true
        name                                        = "tutorial"
        network_data                                = [
            {
                gateway                   = "172.17.0.1"
                global_ipv6_address       = ""
                global_ipv6_prefix_length = 0
                ip_address                = "172.17.0.2"
                ip_prefix_length          = 16
                ipv6_gateway              = ""
                mac_address               = "02:42:ac:11:00:02"
                network_name              = "bridge"
            },
        ]
        network_mode                                = "default"
        privileged                                  = false
        publish_all_ports                           = false
        read_only                                   = false
        remove_volumes                              = true
        restart                                     = "no"
        rm                                          = false
        runtime                                     = "runc"
        security_opts                               = []
        shm_size                                    = 64
        start                                       = true
        stdin_open                                  = false
        stop_signal                                 = "SIGQUIT"
        stop_timeout                                = 0
        tty                                         = false
        wait                                        = false
        wait_timeout                                = 60

        ports {
            external = 8000
            internal = 80
            ip       = "0.0.0.0"
            protocol = "tcp"
        }
    }
    ganslev@MacBook-Pro-5 learn-terraform-docker-container % terraform state show 'docker_image.nginx'
    # docker_image.nginx:
    resource "docker_image" "nginx" {
        id           = "sha256:2a4fbb36e96607b16e5af2e24dc6a1025a4795520c98c6b9ead9c4113617cb73nginx:latest"
        image_id     = "sha256:2a4fbb36e96607b16e5af2e24dc6a1025a4795520c98c6b9ead9c4113617cb73"
        keep_locally = false
        name         = "nginx:latest"
        repo_digest  = "nginx@sha256:32da30332506740a2f7c34d5dc70467b7f14ec67d912703568daff790ab3f755"
    }

## Output of `terraform state list`

`docker_container.nginx
docker_image.nginx`
