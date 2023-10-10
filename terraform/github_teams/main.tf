terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.3.0"
    }
  }
}

resource "github_repository" "example_repository" {
  name        = "ExampleRepository"
  description = "My devOps rep"
  visibility  = "private"
}


resource "github_team" "team_push" {
  name = "teamPush"
}

resource "github_team" "team_admin" {
  name = "teamAdmin"
}

resource "github_team_repository" "team_push_access" {
  repository = github_repository.example_repository.name
  team_id    = github_team.team_push.id
  permission = "push"
}

resource "github_team_repository" "team_admin_access" {
  repository = github_repository.example_repository.name
  team_id    = github_team.team_admin.id
  permission = "admin"
}
