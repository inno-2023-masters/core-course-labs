provider "github" {
  token = var.token
}

resource "github_repository" "devops-labs-tf" {
  name             = "devops-labs-tf"
  visibility       = "public"
  has_issues       = true
  has_wiki         = true
  auto_init        = true
  license_template = "mit"
}

# Set default branch to "main"
resource "github_branch_default" "main" {
  repository = github_repository.devops-labs-tf.name
  branch     = "main"
}

# Create branch protection rule to protect the default branch
resource "github_branch_protection" "default" {
  repository_id                   = github_repository.devops-labs-tf.id
  pattern                         = github_branch_default.main.branch
  require_conversation_resolution = true
  enforce_admins                  = true

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}

resource "github_team" "teamA" {
  name        = "teamA"
  description = "Team A group"
}

resource "github_team" "teamB" {
  name        = "teamB"
  description = "Team B group"
}

resource "github_team_repository" "teamA_repo" {
  team_id    = github_team.teamA.id
  repository = github_repository.devops-labs-tf.name
  permission = "admin"
}

resource "github_team_repository" "teamB_repo" {
  team_id    = github_team.teamB.id
  repository = github_repository.devops-labs-tf.name
  permission = "admin"
}