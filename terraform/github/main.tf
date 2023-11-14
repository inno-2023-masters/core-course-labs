terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.36.0"
    }
  }
  required_version = ">= 0.13"
}

provider "github" {
  token = var.github_token
  owner = var.github_owner
}

resource "github_repository" "devlabs" {
  name             = "devlabs"
  description      = "Lab work"
  visibility       = "public"
  has_issues       = true
  has_wiki         = true
  auto_init        = true
  license_template = "mit"
}

resource "github_branch_default" "main" {
  repository = github_repository.devlabs.name
  branch     = "main"
}

resource "github_branch_protection" "default" {
  repository_id                   = github_repository.devlabs.id
  pattern                         = github_branch_default.main.branch
  require_conversation_resolution = true
  enforce_admins                  = true
  allows_deletions                = false

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}


resource "github_team" "first" {
  name        = "first"
  description = "Team first"
}

resource "github_team" "second" {
  name        = "second"
  description = "Team second"
}

resource "github_team_repository" "first_repo" {
  team_id    = github_team.first.id
  repository = github_repository.devlabs.name
  permission = "push"
}

resource "github_team_repository" "second_repo" {
  team_id    = github_team.second.id
  repository = github_repository.devlabs.name
  permission = "admin"
}