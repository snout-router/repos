locals {
  template = {
    owner      = local.owner
    repository = github_repository.template_repo.name
  }
}

resource "github_repository" "template_repo" {
  lifecycle {
    prevent_destroy = true
  }

  name         = "template-repo"
  description  = "A template repo for Snout TypeScript projects"
  homepage_url = local.primary_url

  has_projects = false
  has_wiki     = false
  is_template  = true

  delete_branch_on_merge = true
  vulnerability_alerts   = true
}
