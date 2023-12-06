terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "github" {
  token = var.github_token
}

resource "github_repository" "repo" {
  name               = var.repository_name
  description        = var.repository_description
  visibility         = var.repository_visibility
  has_issues         = true
  has_wiki           = true
  auto_init          = true
  license_template   = "mit"
  gitignore_template = "VisualStudio"
}

resource "github_branch_default" "main" {
  repository = github_repository.repo.name
  branch     = var.default_branch
}

resource "github_branch_protection" "default" {
  repository_id                   = github_repository.repo.id
  pattern                         = github_branch_default.main.branch
  require_conversation_resolution = var.repository_require_conversation_resolution
  enforce_admins                  = var.repository_enforce_admins

  required_pull_request_reviews {
    required_approving_review_count = var.repository_required_approving_review_count
  }
}