resource "github_repository" "this" {
  lifecycle {
    prevent_destroy = true
  }

  archive_on_destroy = true

  name         = var.name
  description  = var.description
  topics       = var.topics
  visibility   = "public"
  homepage_url = var.has_website ? "https://snout.dev/${var.name}" : "https://snout.dev"

  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true
  vulnerability_alerts   = true

  dynamic "template" {
    for_each = var.from_template ? [null] : []
    content {
      owner      = "snout-router"
      repository = "template-repo"
    }
  }

  dynamic "pages" {
    for_each = var.has_website ? [null] : []
    content {
      source {
        branch = "gh-pages"
      }
    }
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
