terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.3.0"
    }
  }
}


resource "github_repository" "repo" {
  name               = "test_repo"
  description        = "test_repo"
  visibility         = "public"
  has_issues         = true
  auto_init          = true
  allow_squash_merge = false
}

resource "github_branch_default" "main" {
  repository = github_repository.repo.name
  branch     = "main"
}

resource "github_branch_protection" "default" {
  repository_id                   = github_repository.repo.id
  pattern                         = github_branch_default.main.branch
  require_conversation_resolution = true
  enforce_admins                  = true
}

resource "github_repository" "core" {
  description = "Innopolis DevOps"
  auto_init    = true
  name        = "test_devops"
  visibility  = "public"
}

resource "github_branch_default" "core_main" {
  repository = github_repository.core.name
  branch     = "main"
}