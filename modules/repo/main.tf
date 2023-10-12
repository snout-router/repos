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

data "github_repository" "this" {
  depends_on = [
    github_repository.this
  ]

  name = github_repository.this.name
}

resource "github_branch_protection" "default_branch" {
  repository_id = github_repository.this.node_id

  pattern        = data.github_repository.this.default_branch
  enforce_admins = true
}
