resource "github_repository" "dot_github" {
  archive_on_destroy = true

  name         = ".github"
  description  = "The community health files for the Snout organization"
  homepage_url = module.constants.primary_url

  has_issues   = false
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true
  vulnerability_alerts   = true
}

data "github_repository" "dot_github" {
  depends_on = [
    github_repository.dot_github
  ]

  name = ".github"
}

resource "github_branch_protection" "dot_github_default_branch" {
  repository_id = github_repository.dot_github.node_id

  pattern        = data.github_repository.dot_github.default_branch
  enforce_admins = true
}

resource "github_repository_file" "dot_github_license" {
  commit_author       = module.constants.committer.name
  commit_email        = module.constants.committer.email
  repository          = github_repository.dot_github.name
  branch              = github_repository.dot_github.default_branch
  file                = "LICENSE"
  content             = module.constants.license
  commit_message      = "Update license"
  overwrite_on_create = true
}

resource "github_repository" "dot_github_dot_io" {
  archive_on_destroy = true

  name         = "${module.constants.org}.github.io"
  description  = "The Snout website"
  homepage_url = module.constants.primary_url

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
    cname = module.constants.primary_domain
    source {
      branch = "main"
    }
  }
}

data "github_repository" "dot_github_dot_io" {
  depends_on = [
    github_repository.dot_github_dot_io
  ]

  name = "${module.constants.org}.github.io"
}

resource "github_branch_protection" "dot_github_dot_io_default_branch" {
  repository_id = github_repository.dot_github_dot_io.node_id

  pattern        = data.github_repository.dot_github_dot_io.default_branch
  enforce_admins = true
}

resource "github_repository_file" "dot_github_dot_io_license" {
  commit_author       = module.constants.committer.name
  commit_email        = module.constants.committer.email
  repository          = github_repository.dot_github_dot_io.name
  branch              = github_repository.dot_github_dot_io.default_branch
  file                = "LICENSE"
  content             = module.constants.license
  commit_message      = "Update license"
  overwrite_on_create = true
}
