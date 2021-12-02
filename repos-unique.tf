resource "github_repository" "dot_github" {
  lifecycle {
    prevent_destroy = true
  }

  name         = ".github"
  description  = "The community health files for the Snout organization"
  homepage_url = local.primary_url

  has_issues   = false
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true
  vulnerability_alerts   = true
}

resource "github_repository" "dot_github_dot_io" {
  lifecycle {
    prevent_destroy = true
  }

  name         = "${local.owner}.github.io"
  description  = "The Snout website"
  homepage_url = local.primary_url

  has_issues   = false
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true
  vulnerability_alerts   = true

  template {
    owner      = local.template.owner
    repository = local.template.repository
  }

  pages {
    cname = local.primary_domain
    source {
      branch = "main"
    }
  }
}
