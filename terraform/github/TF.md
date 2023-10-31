# Bonus Task
https://github.com/devops-course-org/core-course-labs-lab4


Output of `terraform show`:

```shell
# data.github_user.self:
data "github_user" "self" {
    avatar_url   = "https://avatars.githubusercontent.com/u/39545943?v=4"
    followers    = 8
    following    = 10
    gpg_keys     = []
    id           = "39545943"
    location     = "Innopolis. Russia"
    login        = "kerniee"
    name         = "Kernie"
    node_id      = "MDQ6VXNlcjM5NTQ1OTQz"
    public_gists = 0
    public_repos = 26
    site_admin   = false
    ssh_keys     = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDPTDwLdth2wQDNEZF4sfVs8AUgCMy3cHcq4tt0bZ+AsArYDdMThHpcyvS/cavnVf6yGrYNJN4YKO2328ob/YiHclVVgzY4hpDcncZBy4PKzhB5XsSAEraGdP8zx6/0DuGtaRCpIxi0hYnAKgeZQARWZdEpGyIH070c0qZCd5zqmdHO2B68S+FST386d/P8ysFEtBhnxWV/jFxQ11F7rCcm/+FajkSwLOauhuDKezCHIvlZQpQx+wMppINZLom7aBSMRAvShEYTm/KOzSHgnlzIeE713M0rH3CT7JC8H866w6mwl+cvvy49ebs+tDtnkiTOI1wICAjjlfPaIiri9iTZY/59Z9RCT48zt3MfRr02R1WUNNg3sPgq4WXGWZ81sPDn86ZP7SYLNznZSpk1eiyNZZxMQ2Uybc1NyrBvJHcdrpA517bMXAhVX/SfXdT6hlqFk46rNEI70dE9FjRQQ0eJoKGws9jUOgI3R2Pjx6lDSuJ2KiBlTSdwBDdYPP1PEuE=",
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC7i0shEg8+0roG3JUg/jHbAzicDEHfpvg0BRw+4GOs0B/bZC2MZ56UeQqLq7X7HfAYSRIZshntYcw5xfoiQQ9nzWeydhw4EQApLODfp8N6OJzLSMhyhBp0lhaEW1reGTNLWFfl0HIBw43DrI8e/VuthW41PgR6K+P4dzjuKOEt0nbvIbsMMgzK56Qd3qfvqaDUYiXzj2B/3kCu/e9y94ZqzakZNDOBkqRn5Ta3okXKLvbr3TC6LTV1J6hVmGqBh2w/OCrtfnMeF9yF6nAZ0g/GsIu11Fo6FDF5xgtWllIsgUQo0ce6KxjuTuzLbGUus6LEtwodPxSzTJ6HdVq9nevxbUtbj9gRtqTVDbKc86PW3lOIEPZmo1DYolKApYbXsBREIXkenK76psqgAE8lQAGozJcJ7U5yEOQORC9vqlntp6d1le3STHCwgkaIN9dV9XiSnp+G/0063ArBDFioqf3iFtapr8U+A4xgdg7z4lblprTcUjs4Pp8xZ95InKi9d40=",
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAejQxoFOXpogknNFx9Fdn9bz8rtDhP0b6dZnZL4jDy9yGdjtwe21m6AUnOqRDqMiRouaAzmnqXVFvCSSUVbDq3V+l7uMm4NKmadEZ3azrAcCqREiix6n+fcf2an00VJRbKOkpQK+V44gOwoiim8G3ZsY5PQPqpQXVQse2+tJELBE39TR3PCuA6KWz96M2XsSb+v4TMvYVsuLyZ4i3SoixHXNaZToKM8/6mAHnpJ8+NmlKGKEBN6OGBQbU3yMiR7W1bNiuPubxH/vm/2LYujsY1xb+bT2JKWDwZkbdu2+Bs8prUTmDDlU+KhV7a3V4HhO86gq2elZ9zMa4plu4ZtJT",
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCrMy2wngEoWwGHK4nJXeG/E87Ow5G80fk1Z+m9u1mHpldAwrnomz4shZs1rPxZ0Ex/y0ynm5ShYj0vk7Q1QjQON0ymzdgXUk7/EKbykVVWpqRDq7Y8EvyxNVznDMuCB9zIsDo56zw8l3S4feFfo0FS8ePS0DfTsytcL7j7caTQOYf6bRGCWAXytUUOYZJjvfFtHJJmBMxViyFrexF+fDzuDuzy20dzYJ7qRtxQVCaG8Kd3fOvidRkhoPsiZHJKPQMjJzTqNhiiwEOpyN4xrwb0tGx5oA08Z5WQ7+54eCZgAD5oydZaK6uRJGH1z8ne/38T3U7rTkNQDkZUa26lBI7vhJUhsBzhJdo1cTEYBDvOp5Nk35fIZ96ri3YIiwKoEfGHZxCFyC55KvHscSdbc/b5Ea4TsHHJnDFFg/yvN4HyKd0bwWmSyrWnCjrDFUxfWvDSQfQAvwkJss3ISwVIL7nppjCPhLANnC+ymn4sJwYUzkFz8QkfAqxoM/VPyctTAvE=",
    ]
}

# github_branch_default.master:
resource "github_branch_default" "master" {
    branch     = "main"
    id         = "core-course-labs-lab4"
    repository = "core-course-labs-lab4"
}

# github_branch_protection.default:
resource "github_branch_protection" "default" {
    allows_deletions                = false
    allows_force_pushes             = false
    blocks_creations                = false
    enforce_admins                  = true
    id                              = "BPR_kwDOKYhzFc4CgSIf"
    pattern                         = "main"
    push_restrictions               = []
    repository_id                   = "core-course-labs-lab4"
    require_conversation_resolution = true
    require_signed_commits          = false
    required_linear_history         = false

    required_pull_request_reviews {
        dismiss_stale_reviews           = false
        dismissal_restrictions          = []
        pull_request_bypassers          = []
        require_code_owner_reviews      = false
        required_approving_review_count = 1
        restrict_dismissals             = false
    }
}

# github_membership.all["kerniee"]:
resource "github_membership" "all" {
    etag     = "W/\"0681ba5a008f5b94fdf9f7cbcca04fd18656514bca5522613e215b52e2cc2568\""
    id       = "devops-course-org:kerniee"
    role     = "admin"
    username = "kerniee"
}

# github_repository.core-course-labs-lab4:
resource "github_repository" "core-course-labs-lab4" {
    allow_auto_merge            = false
    allow_merge_commit          = true
    allow_rebase_merge          = true
    allow_squash_merge          = true
    archived                    = false
    auto_init                   = false
    branches                    = [
        {
            name      = "lab1"
            protected = false
        },
        {
            name      = "lab2"
            protected = false
        },
        {
            name      = "lab3"
            protected = false
        },
        {
            name      = "main"
            protected = false
        },
    ]
    default_branch              = "main"
    delete_branch_on_merge      = false
    description                 = "DevOps Inno labs"
    etag                        = "W/\"53c9b73af5e9e754f46504c6335a60543200b694e41a657c52f8e950a032e3bc\""
    full_name                   = "devops-course-org/core-course-labs-lab4"
    git_clone_url               = "git://github.com/devops-course-org/core-course-labs-lab4.git"
    has_downloads               = true
    has_issues                  = false
    has_projects                = true
    has_wiki                    = true
    html_url                    = "https://github.com/devops-course-org/core-course-labs-lab4"
    http_clone_url              = "https://github.com/devops-course-org/core-course-labs-lab4.git"
    id                          = "core-course-labs-lab4"
    is_template                 = false
    merge_commit_message        = "PR_TITLE"
    merge_commit_title          = "MERGE_MESSAGE"
    name                        = "core-course-labs-lab4"
    node_id                     = "R_kgDOKYhzFQ"
    private                     = false
    repo_id                     = 696808213
    squash_merge_commit_message = "COMMIT_MESSAGES"
    squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
    ssh_clone_url               = "git@github.com:devops-course-org/core-course-labs-lab4.git"
    svn_url                     = "https://github.com/devops-course-org/core-course-labs-lab4"
    topics                      = []
    visibility                  = "public"
    vulnerability_alerts        = false
}

# github_team.all["Developer Team"]:
resource "github_team" "all" {
    create_default_maintainer = true
    description               = "Developer Team [Learn TF]"
    etag                      = "W/\"58c8520c7eb336c09f50f8f86a33406021cee95df098ef548a5518e6eb2b13fc\""
    id                        = "8644137"
    members_count             = 1
    name                      = "Developer Team"
    node_id                   = "T_kwDOCLEBo84Ag-Yp"
    privacy                   = "closed"
    slug                      = "developer-team"
}

# github_team.all["Security Team"]:
resource "github_team" "all" {
    create_default_maintainer = true
    description               = "Security Team [Learn TF]"
    etag                      = "W/\"22b1ac44d542a58d96973686da8575addf191af993a2a8a34c782977a7f43b0f\""
    id                        = "8644136"
    members_count             = 1
    name                      = "Security Team"
    node_id                   = "T_kwDOCLEBo84Ag-Yo"
    privacy                   = "closed"
    slug                      = "security-team"
}

# github_team_repository.core-course-labs-lab4["Developer Team"]:
resource "github_team_repository" "core-course-labs-lab4" {
    etag       = "W/\"ffe25471c4d3ace345ec2bb38025329d09e8d8635b1894cfbdb2e22160c671ac\""
    id         = "8644137:core-course-labs-lab4"
    permission = "push"
    repository = "core-course-labs-lab4"
    team_id    = "8644137"
}

# github_team_repository.core-course-labs-lab4["Security Team"]:
resource "github_team_repository" "core-course-labs-lab4" {
    etag       = "W/\"b769601af2ab15663536a3fb6947155f14003d2dbf31de347fb3c475410d1981\""
    id         = "8644136:core-course-labs-lab4"
    permission = "maintain"
    repository = "core-course-labs-lab4"
    team_id    = "8644136"
}
```