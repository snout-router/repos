resource "github_repository" "this" {
  archive_on_destroy = true

  name         = var.name
  description  = var.description
  visibility   = "public"
  homepage_url = "https://snout.dev/${var.name}"

  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true

  template {
    owner      = "snout-router"
    repository = "template-repo"
  }
}

data "github_team" "dependabot_reviewers" {
  slug = "dependabot-reviewers"
}

resource "github_team_repository" "dependabot_reviewers" {
  team_id    = data.github_team.dependabot_reviewers.id
  repository = github_repository.this.name
  permission = "maintain"
}
