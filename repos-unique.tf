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
