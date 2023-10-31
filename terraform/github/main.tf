### Main.tf ###

provider "github" {
  token = var.token # or `GITHUB_TOKEN`
}

data "github_user" "self" {
  username = ""
}

#Create and initialise a public GitHub Repository with MIT license and a Visual Studio .gitignore file (incl. issues and wiki)
resource "github_repository" "core-course-labs-lab4" {
  name          = "core-course-labs-lab4"
  description   = "DevOps Inno labs"
  has_downloads = true
  has_projects  = true
  has_wiki      = true
  visibility    = "public"
}

# Add memberships for infrastructure repository
resource "github_team_repository" "core-course-labs-lab4" {
  for_each = {
    for team in local.repo_teams_files["core-course-labs"] :
    team.team_name => {
      team_id    = github_team.all[team.team_name].id
      permission = team.permission
    } if lookup(github_team.all, team.team_name, false) != false
  }

  team_id    = each.value.team_id
  repository = github_repository.core-course-labs-lab4.id
  permission = each.value.permission
}

#Set default branch 'master'
resource "github_branch_default" "master" {
  repository = github_repository.core-course-labs-lab4.name
  branch     = "main"
}

#Create branch protection rule to protect the default branch. (Use "github_branch_protection_v3" resource for Organisation rules)
resource "github_branch_protection" "default" {
  repository_id                   = github_repository.core-course-labs-lab4.id
  pattern                         = github_branch_default.master.branch
  require_conversation_resolution = true
  enforce_admins                  = true

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}