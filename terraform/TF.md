# Terraform Best Practices 
1. Directory Structure: Describes the recommended directory structure for my Terraform project. I've organized my code, variables, and modules in a clear and consistent manner.
2. Using built-in formatting. Terraform files conform to the standards of terraform fmt.
3. Reviewing and planning: I used terraform plan to see a preview of the changes.
4. Testing: Using tool terraform validate for testing. 
5. Using variables: I've utilized Terraform variables to parameterize. 
6. Documentation: Documentation includes for code descriptions of variables, resources. 

# Docker

## terraform state show

  This command shows the attributes of a single resource in the Terraform
  state. The address argument must be used to specify a single resource.
  You can view the list of available resources with "terraform state list".

Options:

  -state=statefile    Path to a Terraform state file to use to look
                      up Terraform-managed resources. By default it will
                      use the state "terraform.tfstate" if it exists.


## terraform state list
docker_container.nginx
docker_image.nginx


## terraform output
docker_container_name = "my-docker_container"


# AWS

## terraform apply 

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:
```
  # aws_instance.app_server will be created
  + resource "aws_instance" "app_server" {
      + ami                                  = "ami-830c94e3"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "ExampleAppServerInstance"
        }
      + tags_all                             = {
          + "Name" = "ExampleAppServerInstance"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
    }
```
## terraform show
# aws_instance.app_server:
resource "aws_instance" "app_server" {
    ami                                  = "ami-830c94e3"
    arn                                  = "arn:aws:ec2:us-west-2:358405061821:instance/i-0676ab953675d16e7"
    associate_public_ip_address          = true
    availability_zone                    = "us-west-2b"
    cpu_core_count                       = 1
    cpu_threads_per_core                 = 1
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    id                                   = "i-0676ab953675d16e7"
    instance_initiated_shutdown_behavior = "stop"
    instance_state                       = "running"
    instance_type                        = "t2.micro"
    ipv6_address_count                   = 0
    ipv6_addresses                       = []
    monitoring                           = false
    placement_partition_number           = 0
    primary_network_interface_id         = "eni-005c060e1166fbdf7"
    private_dns                          = "ip-172-31-25-102.us-west-2.compute.internal"
    private_ip                           = "172.31.25.102"
    public_dns                           = "ec2-54-188-6-129.us-west-2.compute.amazonaws.com"
    public_ip                            = "54.188.6.129"
    secondary_private_ips                = []
    security_groups                      = [
        "default",
    ]
    source_dest_check                    = true
    subnet_id                            = "subnet-0f43d32cad6562696"
    tags                                 = {
        "Name" = "ExampleAppServerInstance"
    }
    tags_all                             = {
        "Name" = "ExampleAppServerInstance"
    }
    tenancy                              = "default"
    user_data_replace_on_change          = false
    vpc_security_group_ids               = [
        "sg-0bf4fc15624815592",
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
        http_put_response_hop_limit = 1
        http_tokens                 = "optional"
        instance_metadata_tags      = "disabled"
    }

    private_dns_name_options {
        enable_resource_name_dns_a_record    = false
        enable_resource_name_dns_aaaa_record = false
        hostname_type                        = "ip-name"
    }

    root_block_device {
        delete_on_termination = true
        device_name           = "/dev/sda1"
        encrypted             = false
        iops                  = 0
        tags                  = {}
        throughput            = 0
        volume_id             = "vol-003310827cd2e8db9"
        volume_size           = 8
        volume_type           = "standard"
    }
}

## terraform state list 
aws_instance.app_server

# GitHub

## terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:
```
  # github_branch_default.main will be created
  + resource "github_branch_default" "main" {
      + branch     = "main"
      + id         = (known after apply)
      + rename     = false
      + repository = "devops"
    }

  # github_branch_protection.default will be created
  + resource "github_branch_protection" "default" {
      + allows_deletions                = false
      + allows_force_pushes             = false
      + blocks_creations                = false
      + enforce_admins                  = true
      + id                              = (known after apply)
      + lock_branch                     = false
      + pattern                         = "main"
      + repository_id                   = (known after apply)
      + require_conversation_resolution = true
      + require_signed_commits          = false
      + required_linear_history         = false

      + required_pull_request_reviews {
          + require_last_push_approval      = false
          + required_approving_review_count = 1
        }
    }

  # github_repository.devops will be created
  + resource "github_repository" "devops" {
      + allow_auto_merge            = false
      + allow_merge_commit          = true
      + allow_rebase_merge          = true
      + allow_squash_merge          = true
      + archived                    = false
      + auto_init                   = true
      + default_branch              = (known after apply)
      + delete_branch_on_merge      = false
      + description                 = "Lab work"
      + etag                        = (known after apply)
      + full_name                   = (known after apply)
      + git_clone_url               = (known after apply)
      + has_issues                  = true
      + has_wiki                    = true
      + html_url                    = (known after apply)
      + http_clone_url              = (known after apply)
      + id                          = (known after apply)
      + license_template            = "mit"
      + merge_commit_message        = "PR_TITLE"
      + merge_commit_title          = "MERGE_MESSAGE"
      + name                        = "devops"
      + node_id                     = (known after apply)
      + primary_language            = (known after apply)
      + private                     = (known after apply)
      + repo_id                     = (known after apply)
      + squash_merge_commit_message = "COMMIT_MESSAGES"
      + squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
      + ssh_clone_url               = (known after apply)
      + svn_url                     = (known after apply)
      + topics                      = (known after apply)
      + visibility                  = "public"
    }

## terraform show
# github_branch_default.main:
resource "github_branch_default" "main" {
    branch     = "main"
    id         = "devops"
    rename     = false
    repository = "devops"
}

# github_branch_protection.default:
resource "github_branch_protection" "default" {
    allows_deletions                = false
    allows_force_pushes             = false
    blocks_creations                = false
    enforce_admins                  = true
    id                              = "BPR_kwDOKYt-m84CgWh9"
    lock_branch                     = false
    pattern                         = "main"
    repository_id                   = "devops"
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

# github_repository.devops:
resource "github_repository" "devops" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = true
    allow_squash_merge          = true
    allow_update_branch         = false
    archived                    = false
    auto_init                   = true
    default_branch              = "main"
    delete_branch_on_merge      = false
    description                 = "Lab work"
    etag                        = "W/\"37830e429ddf93b2d66eccac1072dbda3aeceb56c9ef13024252f698ee031668\""
    full_name                   = "girllwhocodes/devops"
    git_clone_url               = "git://github.com/girllwhocodes/devops.git"
    has_discussions             = false
    has_downloads               = false
    has_issues                  = true
    has_projects                = false
    has_wiki                    = true
    html_url                    = "https://github.com/girllwhocodes/devops"
    http_clone_url              = "https://github.com/girllwhocodes/devops.git"
    id                          = "devops"
    is_template                 = false
    license_template            = "mit"
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "devops"
    node_id                     = "R_kgDOKYt-mw"
    private                     = false
    repo_id                     = 697007771
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:girllwhocodes/devops.git"
    svn_url                     = "https://github.com/girllwhocodes/devops"
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

## terraform state list 
```
github_branch_default.main
github_branch_protection.default
github_repository.devops
```

# Github Teams

## terraform plan
```
ithub_repository.devlabs: Refreshing state... [id=devlabs]
github_branch_default.main: Refreshing state... [id=devlabs]
github_branch_protection.default: Refreshing state... [id=BPR_kwDOKYu2Pc4CgW0u]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
  ~ update in-place

Terraform will perform the following actions:

  # github_repository.devlabs will be updated in-place
  ~ resource "github_repository" "devlabs" {
      + description                 = "Lab work"
      - has_downloads               = true -> null
      - has_projects                = true -> null
        id                          = "devlabs"
        name                        = "devlabs"
        # (31 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

  # github_team.first will be created
  + resource "github_team" "first" {
      + create_default_maintainer = false
      + description               = "Team first"
      + etag                      = (known after apply)
      + id                        = (known after apply)
      + members_count             = (known after apply)
      + name                      = "first"
      + node_id                   = (known after apply)
      + parent_team_read_id       = (known after apply)
      + parent_team_read_slug     = (known after apply)
      + privacy                   = "secret"
      + slug                      = (known after apply)
    }

  # github_team.second will be created
  + resource "github_team" "second" {
      + create_default_maintainer = false
      + description               = "Team second"
      + etag                      = (known after apply)
      + id                        = (known after apply)
      + members_count             = (known after apply)
      + name                      = "second"
      + node_id                   = (known after apply)
      + parent_team_read_id       = (known after apply)
      + parent_team_read_slug     = (known after apply)
      + privacy                   = "secret"
      + slug                      = (known after apply)
    }

  # github_team_repository.first_repo will be created
  + resource "github_team_repository" "first_repo" {
      + etag       = (known after apply)
      + id         = (known after apply)
      + permission = "push"
      + repository = "devlabs"
      + team_id    = (known after apply)
    }

  # github_team_repository.second_repo will be created
  + resource "github_team_repository" "second_repo" {
      + etag       = (known after apply)
      + id         = (known after apply)
      + permission = "admin"
      + repository = "devlabs"
      + team_id    = (known after apply)
    }

Plan: 4 to add, 1 to change, 0 to destroy.
```

## terraaform show

```
# github_branch_default.main:
resource "github_branch_default" "main" {
    branch     = "main"
    id         = "devlabs"
    rename     = false
    repository = "devlabs"
}

# github_branch_protection.default:
resource "github_branch_protection" "default" {
    allows_deletions                = false
    allows_force_pushes             = false
    blocks_creations                = false
    enforce_admins                  = true
    force_push_bypassers            = []
    id                              = "BPR_kwDOKYu2Pc4CgW0u"
    lock_branch                     = false
    pattern                         = "main"
    push_restrictions               = []
    repository_id                   = "devlabs"
    require_conversation_resolution = true
    require_signed_commits          = false
    required_linear_history         = false

    required_pull_request_reviews {
        dismiss_stale_reviews           = false
        dismissal_restrictions          = []
        pull_request_bypassers          = []
        require_code_owner_reviews      = false
        require_last_push_approval      = false
        required_approving_review_count = 1
        restrict_dismissals             = false
    }
}

# github_repository.devlabs:
resource "github_repository" "devlabs" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = true
    allow_squash_merge          = true
    allow_update_branch         = false
    archived                    = false
    auto_init                   = true
    default_branch              = "main"
    delete_branch_on_merge      = false
    description                 = "Lab work"
    etag                        = "W/\"c88f7809f955e738e610ad817d3af63abb2df74bb5ca4f059564e89b7b0934de\""
    full_name                   = "my-dev-organization/devlabs"
    git_clone_url               = "git://github.com/my-dev-organization/devlabs.git"
    has_discussions             = false
    has_downloads               = false
    has_issues                  = true
    has_projects                = false
    has_wiki                    = true
    html_url                    = "https://github.com/my-dev-organization/devlabs"
    http_clone_url              = "https://github.com/my-dev-organization/devlabs.git"
    id                          = "devlabs"
    is_template                 = false
    license_template            = "mit"
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "devlabs"
    node_id                     = "R_kgDOKYuptg"
    private                     = false
    repo_id                     = 697018806
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:my-dev-organization/devlabs.git"
    svn_url                     = "https://github.com/my-dev-organization/devlabs"
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

# github_team.first:
resource "github_team" "first" {
    create_default_maintainer = false
    description               = "Team first"
    etag                      = "W/\"68b1775160950aac8275ab56fa7557c488f8dbd7c64c94100620dc8727bf78d8\""
    id                        = "8647154"
    members_count             = 0
    name                      = "first"
    node_id                   = "T_kwDOCLXuW84Ag_Hy"
    privacy                   = "secret"
    slug                      = "first"
}

# github_team.second:
resource "github_team" "second" {
    create_default_maintainer = false
    description               = "Team second"
    etag                      = "W/\"601dcf115cc83b79a797bf49ae6ca63551a0fe94e28f31bca537836e7f726da8\""
    id                        = "8647153"
    members_count             = 0
    name                      = "second"
    node_id                   = "T_kwDOCLXuW84Ag_Hx"
    privacy                   = "secret"
    slug                      = "second"
}

# github_team_repository.first_repo:
resource "github_team_repository" "first_repo" {
    etag       = "W/\"18edd7d9720cdd5f7b9efbfe8d536c43072d222be03d25e951af57ec61485304\""
    id         = "8647154:devlabs"
    permission = "push"
    repository = "devlabs"
    team_id    = "8647154"
}

# github_team_repository.second_repo:
resource "github_team_repository" "second_repo" {
    etag       = "W/\"0f2a04ddeff7f7969aa20c8f0179966fe787b49d8eaa5240a15f3e4ec6f43c9d\""
    id         = "8647153:devlabs"
    permission = "admin"
    repository = "devlabs"
    team_id    = "8647153"
}
```
## terraform state list 

```
github_branch_default.main
github_branch_protection.default
github_repository.devlabs
github_team.first
github_team.second
github_team_repository.first_repo
github_team_repository.second_repo
```
