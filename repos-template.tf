locals {
  template = {
    owner      = module.constants.org
    repository = github_repository.template_repo.name
  }
}

resource "github_repository" "template_repo" {
  archive_on_destroy = false

  name         = "template-repo"
  description  = "A template repo for Snout TypeScript projects"
  homepage_url = module.constants.primary_url

  has_issues   = true
  has_projects = false
  has_wiki     = false
  is_template  = true

  delete_branch_on_merge = true
  vulnerability_alerts   = true
}

data "github_repository" "template_repo" {
  depends_on = [
    github_repository.template_repo
  ]

  name = github_repository.template_repo.name
}

resource "github_branch_protection" "template_repo_default_branch" {
  repository_id = github_repository.template_repo.node_id

  pattern        = data.github_repository.template_repo.default_branch
  enforce_admins = true
}

resource "github_repository_file" "template_repo_license" {
  commit_author       = module.constants.committer.name
  commit_email        = module.constants.committer.email
  repository          = github_repository.template_repo.name
  file                = "LICENSE"
  content             = module.constants.license
  commit_message      = "Update license"
  overwrite_on_create = true
}

resource "github_repository_file" "template_dot_github_renovate_json" {
  commit_author       = module.constants.committer.name
  commit_email        = module.constants.committer.email
  repository          = github_repository.template_repo.name
  file                = ".github/renovate.json"
  commit_message      = "Update Renovate configuration"
  overwrite_on_create = true

  content = templatefile("dot-github/renovate.json", {
    org = module.constants.org
  })
}

module "template_repo_issue_labels" {
  source     = "./modules/issue-labels"
  repository = github_repository.template_repo.name
}
