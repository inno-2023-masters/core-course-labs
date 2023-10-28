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

resource "github_repository" "test_devops" {
  name             = "test_devops"
  description      = "Assignments for DevOps Course at Innopolis University"
  visibility       = "public"
  has_issues       = true
  has_wiki         = true
  auto_init        = true
  license_template = "mit"
}

# Set default branch to "main"
resource "github_branch_default" "main" {
  repository = github_repository.test_devops.name
  branch     = "main"
}

# Create branch protection rule to protect the default branch
resource "github_branch_protection" "default" {
  repository_id                   = github_repository.test_devops.id
  pattern                         = github_branch_default.main.branch
  require_conversation_resolution = true
  enforce_admins                  = true
  allows_deletions                = false

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}

resource "github_team" "team1" {
  name        = "team1"
  description = "Team 1"
}

resource "github_team" "team2" {
  name        = "team2"
  description = "Team 2"
}

resource "github_team_repository" "team1_repo" {
  team_id = github_team.team1.id
  repository = github_repository.test_devops.name
  permission = "push"
}

resource "github_team_repository" "team2_repo" {
  team_id = github_team.team2.id
  repository = github_repository.test_devops.name
  permission = "admin"
}
