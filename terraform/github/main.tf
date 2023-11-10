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

resource "github_repository" "ma-cute-repo" {
  name             = "ma-cute-repo"
  description      = "DevOps Course at Innopolis University"
  visibility       = "public"
  has_issues       = true
  has_wiki         = true
  auto_init        = true
  license_template = "mit"
}

resource "github_branch_default" "main" {
  repository = github_repository.ma-cute-repo.name
  branch     = "main"
}

resource "github_branch_protection" "default" {
  repository_id                   = github_repository.ma-cute-repo.id
  pattern                         = github_branch_default.main.branch
  require_conversation_resolution = true
  enforce_admins                  = true
  allows_deletions                = false

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}

resource "github_team" "pink" {
  name        = "pink"
  description = "Team Pink"
}

resource "github_team" "blue" {
  name        = "blue"
  description = "Team Blue"
}

resource "github_team_repository" "pink_repo" {
  team_id    = github_team.pink.id
  repository = github_repository.ma-cute-repo.name
  permission = "push"
}

resource "github_team_repository" "blue_repo" {
  team_id    = github_team.blue.id
  repository = github_repository.ma-cute-repo.name
  permission = "admin"
}
