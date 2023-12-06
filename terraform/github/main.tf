provider "github" {
  token = var.token
}

resource "github_repository" "repo" {
  name             = "f23-iu-devops"
  description      = "Devops course IU"
  visibility       = "public"
  has_issues       = true
  has_wiki         = true
  auto_init        = true
  license_template = "mit"
}

# Set default branch to "main"
resource "github_branch_default" "main" {
  repository = github_repository.repo.name
  branch     = "main"
}

# Create branch protection rule to protect the default branch
resource "github_branch_protection" "default" {
  repository_id                   = github_repository.repo.id
  pattern                         = github_branch_default.main.branch
  require_conversation_resolution = true
  enforce_admins                  = true

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}

resource "github_team" "team_1" {
  name        = "iu-devops-1"
  description = "first team"
}

resource "github_team" "team_2" {
  name        = "iu-devops-2"
  description = "second team"
}

resource "github_team_repository" "team_1_repo" {
  team_id    = github_team.team_1.id
  repository = github_repository.repo.name
  permission = "maintain"
}

resource "github_team_repository" "team_2_repo" {
  team_id    = github_team.team_2.id
  repository = github_repository.repo.name
  permission = "admin"
}
