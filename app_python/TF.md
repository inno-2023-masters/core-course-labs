## Best Practices

Applied several practices for this project:

- Modularity: code is broken down in main, output, and variables sections for convenience
- Extensive use of variables: used for modularity and security (for example in case of github token)
- Planning before applying: `terraform plan` was used whenever possible before acting.
- Validation: `terraform validate` was used to validate current configs.
- Sensitive data removal: no sensitive data, such as keys or tokens, is in the configs.

## Terraform logs

This `.md` file provides logs of `terraform` commands for docker section.

### Docker

```
terraform state list

docker_container.app_python
docker_image.app_python
```

```
terraform state show docker_container.app_python


resource "docker_container" "app_python" {
    attach                                      = false
    command                                     = []
    container_read_refresh_timeout_milliseconds = 15000
    cpu_shares                                  = 0
    entrypoint                                  = [
        "python",
        "app.py",
    ]
    env                                         = []
    hostname                                    = "0459ee94feeb"
    id                                          = "0459ee94feeb4cc1c47aa5b2fb82802bc90ba412ed1e3b0ea901167a024f690d"
    image                                       = "sha256:612356ea862c60d12f4359657c3ebb7abd3f131e6654f7e1da320aec85aff18d"
    init                                        = false
    ipc_mode                                    = "private"
    log_driver                                  = "json-file"
    logs                                        = false
    max_retry_count                             = 0
    memory                                      = 0
    memory_swap                                 = 0
    must_run                                    = true
    name                                        = "app_python"
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
    stop_timeout                                = 0
    tty                                         = false
    user                                        = "myuser:myuser"
    wait                                        = false
    wait_timeout                                = 60
    working_dir                                 = "/app"

    ports {
        external = 5000
        internal = 5000
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}
```

```
terraform state show docker_image.app_python

resource "docker_image" "app_python" {
    force_remove = true
    id           = "sha256:612356ea862c60d12f4359657c3ebb7abd3f131e6654f7e1da320aec85aff18djustsomedude22/app_python:latest"
    image_id     = "sha256:612356ea862c60d12f4359657c3ebb7abd3f131e6654f7e1da320aec85aff18d"
    keep_locally = false
    name         = "justsomedude22/app_python:latest"
    repo_digest  = "justsomedude22/app_python@sha256:88ee4e16f16ac85bc2fc48ea7f19a38809c214d3eec5670a537639d998b852cc"
}
```

```
terraform output

container = "08f755c6632c7eef93639e1e8f1c625edb443101c28c1b1e4b644f56a0e75779"
image = "sha256:612356ea862c60d12f4359657c3ebb7abd3f131e6654f7e1da320aec85aff18djustsomedude22/app_python:latest"
```

### AWS

```
terraform state show aws_instance.app_python

resource "aws_instance" "app_python" {
    ami                                  = "ami-03a6eaae9938c858c"
    arn                                  = "arn:aws:ec2:us-east-1:524111592272:instance/i-02921771d8c9216ac"
    associate_public_ip_address          = true
    availability_zone                    = "us-east-1c"
    cpu_core_count                       = 1
    cpu_threads_per_core                 = 1
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    id                                   = "i-02921771d8c9216ac"
    instance_initiated_shutdown_behavior = "stop"
    instance_state                       = "running"
    instance_type                        = "t2.micro"
    ipv6_address_count                   = 0
    ipv6_addresses                       = []
    monitoring                           = false
    placement_partition_number           = 0
    primary_network_interface_id         = "eni-04698d6db0cd09632"
    private_dns                          = "ip-172-31-95-238.ec2.internal"
    private_ip                           = "172.31.95.238"
    public_dns                           = "ec2-18-212-49-89.compute-1.amazonaws.com"
    public_ip                            = "18.212.49.89"
    secondary_private_ips                = []
    security_groups                      = [
        "default",
    ]
    source_dest_check                    = true
    subnet_id                            = "subnet-03a7e9be77331df8a"
    tags                                 = {
        "Name" = "app_python"
    }
    tags_all                             = {
        "Name" = "app_python"
    }
    tenancy                              = "default"
    user_data_replace_on_change          = false
    vpc_security_group_ids               = [
        "sg-00a0f070309f5e185",
    ]

    capacity_reservation_specification {
        capacity_reservation_preference = "open"
    }

    cpu_options {
        core_count       = 1
        threads_per_core = 1
    }

    credit_specification {
        cpu_credits = "standard"
    }

    enclave_options {
        enabled = false
    }

    maintenance_options {
        auto_recovery = "default"
    }

    metadata_options {
        http_endpoint               = "enabled"
        http_put_response_hop_limit = 2
        http_tokens                 = "required"
        instance_metadata_tags      = "disabled"
    }

    private_dns_name_options {
        enable_resource_name_dns_a_record    = false
        enable_resource_name_dns_aaaa_record = false
        hostname_type                        = "ip-name"
    }

    root_block_device {
        delete_on_termination = true
        device_name           = "/dev/xvda"
        encrypted             = false
        iops                  = 3000
        tags                  = {}
        throughput            = 125
        volume_id             = "vol-0e7fbe3ddc744cc1e"
        volume_size           = 8
        volume_type           = "gp3"
    }
}
```

```
terraform output

public_ip = "18.212.49.89"
```

### Github

```
terraform state show github_branch_default.main

# github_branch_default.main:
resource "github_branch_default" "main" {
    branch     = "main"
    id         = "core-course-labs-test"
    rename     = false
    repository = "core-course-labs-test"
}
```

```
terraform state show github_branch_protection.default
# github_branch_protection.default:
resource "github_branch_protection" "default" {
    allows_deletions                = false
    allows_force_pushes             = false
    blocks_creations                = false
    enforce_admins                  = true
    id                              = "BPR_kwDOKYsrLM4CgV0J"
    lock_branch                     = false
    pattern                         = "main"
    repository_id                   = "core-course-labs-test"
    require_conversation_resolution = true
    require_signed_commits          = false
    required_linear_history         = false

    required_pull_request_reviews {
        dismiss_stale_reviews           = false
        require_code_owner_reviews      = false
        require_last_push_approval      = false
        required_approving_review_count = 1
        restrict_dismissals             = false
    }
}
```

```
terraform state show github_repository.core-course-labs-test
# github_repository.core-course-labs-test:
resource "github_repository" "core-course-labs-test" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = true
    allow_squash_merge          = true
    allow_update_branch         = false
    archived                    = false
    auto_init                   = true
    default_branch              = "main"
    delete_branch_on_merge      = false
    description                 = "Test repository created by terraform"
    etag                        = "W/\"b545e166054005b5152b3e16031379da2b92960544cc1194304d2856d7e2b640\""
    full_name                   = "JustSomeDude2001/core-course-labs-test"
    git_clone_url               = "git://github.com/JustSomeDude2001/core-course-labs-test.git"
    gitignore_template          = "Terraform"
    has_discussions             = false
    has_downloads               = false
    has_issues                  = true
    has_projects                = false
    has_wiki                    = true
    html_url                    = "https://github.com/JustSomeDude2001/core-course-labs-test"
    http_clone_url              = "https://github.com/JustSomeDude2001/core-course-labs-test.git"
    id                          = "core-course-labs-test"
    is_template                 = false
    license_template            = "mit"
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "core-course-labs-test"
    node_id                     = "R_kgDOKYsrLA"
    private                     = false
    repo_id                     = 696986412
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:JustSomeDude2001/core-course-labs-test.git"
    svn_url                     = "https://github.com/JustSomeDude2001/core-course-labs-test"
    topics                      = []
    visibility                  = "public"
    vulnerability_alerts        = false

    security_and_analysis {
        secret_scanning {
            status = "disabled"
        }
        secret_scanning_push_protection {
            status = "disabled"
        }
    }
}
```

Importing

```
sudo terraform import "github_repository.core-course-lab
s-deploy" "core-course-labs"
github_repository.core-course-labs-deploy: Importing from ID "core-course-labs"...
github_repository.core-course-labs-deploy: Import prepared!
  Prepared github_repository for import
github_repository.core-course-labs-deploy: Refreshing state... [id=core-course-labs]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
```

Importing from core repo to deploy repo.

```
sudo terraform apply
github_repository.core-course-labs-test: Refreshing state... [id=core-course-labs-test]
github_repository.core-course-labs-deploy: Refreshing state... [id=core-course-labs]
github_branch_default.main: Refreshing state... [id=core-course-labs-test]
github_branch_protection.default: Refreshing state... [id=BPR_kwDOKYsrLM4CgV0J]

Terraform used the selected providers to generate the following execution plan.
Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # github_repository.core-course-labs-deploy will be updated in-place
  ~ resource "github_repository" "core-course-labs-deploy" {
      ~ full_name                   = "JustSomeDude2001/core-course-labs-deploy" -> (known after apply)
        id                          = "core-course-labs"
      ~ name                        = "core-course-labs" -> "core-course-labs-deploy"
        # (32 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

github_repository.core-course-labs-deploy: Modifying... [id=core-course-labs]
github_repository.core-course-labs-deploy: Modifications complete after 3s [id=core-course-labs-deploy]

Apply complete! Resources: 0 added, 1 changed, 0 destroyed.
```