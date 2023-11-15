terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.2.0"
    }
  }
}

provider "github" {
  owner = "eliza-devops"
  token = var.token
}

resource "github_repository" "devops-course" {
  name        = "devops-course"
  description = "My awesome course"
  visibility  = "public"
  has_issues  = true
  has_wiki    = true
  auto_init   = true
}

resource "github_branch_default" "main" {
  repository = github_repository.devops-course.name
  branch     = "main"
}

resource "github_branch_protection" "default" {
  repository_id                   = github_repository.devops-course.id
  pattern                         = github_branch_default.main.branch
  require_conversation_resolution = true
  enforce_admins                  = true

  required_pull_request_reviews {
    required_approving_review_count = 1
  }

  required_status_checks {
    strict   = true
    contexts = ["ci/test"]
  }
}

resource "github_team" "one" {
  name        = "team-one"
  description = "team 1"
}

resource "github_team" "two" {
  name        = "team-two"
  description = "team 2"
}

resource "github_team_repository" "team_a_to_repo" {
  team_id    = github_team.one.id
  repository = github_repository.devops-course.name
  permission = "push"
}

resource "github_team_repository" "team_b_to_repo" {
  team_id    = github_team.two.id
  repository = github_repository.devops-course.name
  permission = "admin"
}