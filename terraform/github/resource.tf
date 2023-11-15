resource "github_repository" "repo" {
  name        = "devops-course-demo"
  description = "demo repo for devops course"
  visibility  = "public"
  auto_init   = true
}

resource "github_branch_default" "repo_default" {
  repository = github_repository.repo.name
  branch     = "main"
}

resource "github_branch_protection" "default" {
  repository_id                   = github_repository.repo.id
  pattern                         = github_branch_default.repo_default.branch
  require_conversation_resolution = true
  enforce_admins                  = true

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}