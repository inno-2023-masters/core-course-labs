# Terraform

## Docker

* **terraform show:**

```bash
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
    hostname                                    = "d18499cf4b66"
    id                                          = "d18499cf4b6691eff7f02f9c9538934d888d97ac8ffc939bc6a637cdc0c54e6b"
    image                                       = "sha256:61395b4c586da2b9b3b7ca903ea6a448e6783dfdd7f768ff2c1a0f3360aaba99"
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

# docker_image.nginx:
resource "docker_image" "nginx" {
    id           = "sha256:61395b4c586da2b9b3b7ca903ea6a448e6783dfdd7f768ff2c1a0f3360aaba99nginx:latest"
    image_id     = "sha256:61395b4c586da2b9b3b7ca903ea6a448e6783dfdd7f768ff2c1a0f3360aaba99"
    keep_locally = false
    name         = "nginx:latest"
    repo_digest  = "nginx@sha256:32da30332506740a2f7c34d5dc70467b7f14ec67d912703568daff790ab3f755"
}
```

* **terraform state list:**

```bash
docker_container.nginx
docker_image.nginx
```

* **terraform output:**

```bash
container_id = "da2e7d0aa9d630b2947c3b123c38955ea9f349e246a622be3e36a2b7b87fabc8"
image_id = "sha256:61395b4c586da2b9b3b7ca903ea6a448e6783dfdd7f768ff2c1a0f3360aaba99nginx:latest"
```

## Github

* **terraform show:**

```bash
# github_branch_default.main:
resource "github_branch_default" "main" {
    branch     = "main"
    id         = "terraform"
    repository = "terraform"
}

# github_branch_protection.default:
resource "github_branch_protection" "default" {
    allows_deletions                = false
    allows_force_pushes             = false
    blocks_creations                = false
    enforce_admins                  = true
    id                              = "BPR_kwDOKY2dt84CgZ7K"
    pattern                         = "main"
    repository_id                   = "terraform"
    require_conversation_resolution = true
    require_signed_commits          = false
    required_linear_history         = false

    required_pull_request_reviews {
        dismiss_stale_reviews           = false
        require_code_owner_reviews      = false
        required_approving_review_count = 1
        restrict_dismissals             = false
    }
}

# github_repository.repository:
resource "github_repository" "repository" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = true
    allow_squash_merge          = true
    archived                    = false
    auto_init                   = true
    branches                    = [
        {
            name      = "main"
            protected = false
        },
    ]
    default_branch              = "main"
    delete_branch_on_merge      = false
    description                 = "terraform generated repository"
    etag                        = "W/\"2f934a7bbdcaa3d2cca2f48beef7eb405a67389fd15d81707837f875b39d6027\""
    full_name                   = "thecarrot123/terraform"
    git_clone_url               = "git://github.com/thecarrot123/terraform.git"
    gitignore_template          = "VisualStudio"
    has_downloads               = false
    has_issues                  = true
    has_projects                = false
    has_wiki                    = true
    html_url                    = "https://github.com/thecarrot123/terraform"
    http_clone_url              = "https://github.com/thecarrot123/terraform.git"
    id                          = "terraform"
    is_template                 = false
    license_template            = "mit"
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "terraform"
    node_id                     = "R_kgDOKY2dtw"
    private                     = false
    repo_id                     = 697146807
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:thecarrot123/terraform.git"
    svn_url                     = "https://github.com/thecarrot123/terraform"
    visibility                  = "public"
    vulnerability_alerts        = false
}


Outputs:

default_branch = "main"
```

* **terraform state list:**

```bash
github_branch_default.main
github_branch_protection.default
github_repository.repository
```

* **terraform output:**

```bash
default_branch = "main"
```

## Best Practices

1. **Utilize Built-In Validation and Formatting Tools:**

    * Employ Terraform's built-in validation and formatting tools to ensure code consistency. Prior to applying changes, always review the execution plan.

2. **Secure Handling of Sensitive Data:**

    * Safeguard sensitive information, such as state files and secret variables, by refraining from committing them to your Version Control System (VCS). Instead, store them locally but exclude them from VCS tracking, or opt for secure remote storage with encryption, like Terraform's [.gitignore for Terraform](https://www.terraform.io/docs/cli/config/config-file.html#gitignore) functionality.

3. **Effective File Structure:**

    * Establish an organized and structured file layout for your Terraform configurations. This structure should include separate files for resources (`main.tf`), variable definitions (`variables.tf`), and output definitions (`outputs.tf`). Additionally, consider using directories for modularization and to group related components. This enhances code readability and maintainability.
