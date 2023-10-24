
# Add a team to the organization
resource "github_team" "developers" {
  name        = "developers"
  description = "Team for developers"
  privacy     = "closed"
}

resource "github_membership" "my_membership" {
  username = "Klemencya"
  role     = "member"
}

resource "github_team_membership" "my_developers_membership" {
  team_id  = github_team.developers.id
  username = github_membership.my_membership.username
  role     = "maintainer"
}


# Add a team to the organization
resource "github_team" "reviewers" {
  name        = "reviewers"
  description = "Team for reviewers"
  privacy     = "closed"
}

resource "github_team_membership" "my_reviewers_membership" {
  team_id  = github_team.reviewers.id
  username = github_membership.my_membership.username
  role     = "maintainer"
}


resource "github_team_repository" "developers_team_repo" {
  team_id    = github_team.developers.id
  repository = github_repository.repo.name
  permission = "maintain"
}

resource "github_team_repository" "reviewers_team_repo" {
  team_id    = github_team.reviewers.id
  repository = github_repository.repo.name
  permission = "triage"
}
