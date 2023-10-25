resource "github_repository" "repo" {
  name               = "core-course-lab4-terraform"
  description        = "Lab 4"
  visibility         = "public"
  has_issues         = false
  has_wiki           = false
  auto_init          = true
  gitignore_template = "Python"
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

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}