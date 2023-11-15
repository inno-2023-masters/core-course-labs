resource "github_repository" "repo" {
  name        = "devops"
  description = "Assigments for DevOps course"
  visibility  = "public"
  has_issues  = false
  has_wiki    = true
}

resource "github_branch_default" "master" {
  repository = github_repository.repo.name
  branch     = "master"
}

resource "github_branch_protection" "default" {
  repository_id                   = github_repository.repo.id
  pattern                         = github_branch_default.master.branch
  require_conversation_resolution = true
  enforce_admins                  = true

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}
