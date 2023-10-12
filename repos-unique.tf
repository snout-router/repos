resource "github_repository" "dot_github" {
  archive_on_destroy = true

  name         = ".github"
  description  = "The community health files for the Snout organization"
  homepage_url = module.constants.primary_url

  has_issues   = true
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true
  vulnerability_alerts   = true
}

data "github_repository" "dot_github" {
  depends_on = [
    github_repository.dot_github
  ]

  name = github_repository.dot_github.name
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
  file                = "LICENSE"
  content             = module.constants.license
  commit_message      = "Update license"
  overwrite_on_create = true
}

resource "github_repository_file" "dot_github_dot_github_renovate_json" {
  count = 1

  commit_author       = module.constants.committer.name
  commit_email        = module.constants.committer.email
  repository          = github_repository.dot_github.name
  file                = ".github/renovate.json"
  commit_message      = "Update Renovate configuration"
  overwrite_on_create = true

  content = templatefile("dot-github/renovate.json", {
    org = module.constants.org
  })
}

module "dot_github_issue_labels" {
  source     = "./modules/issue-labels"
  repository = github_repository.dot_github.name
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

  name = github_repository.dot_github_dot_io.name
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
  file                = "LICENSE"
  content             = module.constants.license
  commit_message      = "Update license"
  overwrite_on_create = true
}

resource "github_repository" "renovate" {
  archive_on_destroy = true

  name         = "renovate"
  description  = "Self-hosted Renovate for Snout"
  homepage_url = "https://github.com/snout/renovate/actions/workflows/renovate.yml"

  has_issues   = true
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true
  vulnerability_alerts   = true
}

data "github_repository" "renovate" {
  depends_on = [
    github_repository.renovate
  ]

  name = github_repository.renovate.name
}

resource "github_branch_protection" "renovate_default_branch" {
  repository_id = github_repository.renovate.node_id

  pattern        = data.github_repository.renovate.default_branch
  enforce_admins = true
}

resource "github_repository_file" "renovate_license" {
  commit_author       = module.constants.committer.name
  commit_email        = module.constants.committer.email
  repository          = github_repository.renovate.name
  file                = "LICENSE"
  content             = module.constants.license
  commit_message      = "Update license"
  overwrite_on_create = true
}

resource "github_repository_file" "renovate_dot_github_renovate_json" {
  count = 1

  commit_author       = module.constants.committer.name
  commit_email        = module.constants.committer.email
  repository          = github_repository.renovate.name
  file                = ".github/renovate.json"
  commit_message      = "Update Renovate configuration"
  overwrite_on_create = true

  content = templatefile("dot-github/renovate.json", {
    org = module.constants.org
  })
}

module "renovate_labels" {
  source     = "./modules/issue-labels"
  repository = github_repository.renovate.name
}
