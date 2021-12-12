locals {
  template = {
    owner      = local.owner
    repository = github_repository.template_repo.name
  }
}

resource "github_repository" "template_repo" {
  archive_on_destroy = true

  name         = "template-repo"
  description  = "A template repo for Snout TypeScript projects"
  homepage_url = local.primary_url

  has_projects = false
  has_wiki     = false
  is_template  = true

  delete_branch_on_merge = true
  vulnerability_alerts   = true
}

resource "github_repository_file" "template_repo_license" {
  repository          = github_repository.template_repo.name
  branch              = github_repository.template_repo.default_branch
  file                = "LICENSE"
  content             = local.license
  commit_message      = "Update license"
  overwrite_on_create = true
}
