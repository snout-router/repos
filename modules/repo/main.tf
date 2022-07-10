resource "github_repository" "this" {
  archive_on_destroy = true

  name        = var.name
  description = var.description
  topics      = var.topics
  visibility  = "public"

  homepage_url = coalesce(
    var.homepage_url,
    var.has_website ? "${module.constants.primary_url}/${var.name}" : module.constants.primary_url,
  )

  auto_init    = true
  has_issues   = true
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true
  vulnerability_alerts   = true

  dynamic "template" {
    for_each = var.template != null ? [null] : []
    content {
      owner      = var.template.owner
      repository = var.template.repository
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
