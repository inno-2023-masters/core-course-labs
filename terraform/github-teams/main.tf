terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "github" {
  owner = var.github_organization
  token = var.github_token
}


resource "github_repository" "testing" {
  name = "testing"
  description = "testing"
  visibility = "public"
}

resource "github_team" "pullers" {
  name = "pullers"
}

resource "github_team" "devs" {
  name = "devs"
}

resource "github_team" "admins" {
  name = "admins"
}

resource "github_team_repository" "team_a_access" {
  repository = github_repository.testing.name
  team_id    = github_team.pullers.id
  permission = "pull"
}

resource "github_team_repository" "team_b_access" {
  repository = github_repository.testing.name
  team_id    = github_team.devs.id
  permission = "maintain"
}

resource "github_team_repository" "team_c_access" {
  repository = github_repository.testing.name
  team_id    = github_team.admins.id
  permission = "admin"
}