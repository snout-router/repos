locals {
  template = {
    owner      = module.constants.org
    repository = github_repository.template_repo.name
  }
}

resource "github_repository" "template_repo" {
  archive_on_destroy = true

  name         = "template-repo"
  description  = "A template repo for Snout TypeScript projects"
  homepage_url = module.constants.primary_url

  has_projects = false
  has_wiki     = false
  is_template  = true

  delete_branch_on_merge = true
  vulnerability_alerts   = true
}

resource "github_repository_file" "template_repo_license" {
  commit_author       = module.constants.committer.name
  commit_email        = module.constants.committer.email
  repository          = github_repository.template_repo.name
  branch              = github_repository.template_repo.default_branch
  file                = "LICENSE"
  content             = module.constants.license
  commit_message      = "Update license"
  overwrite_on_create = true
}

resource "github_repository_file" "template_repo_dot_github_workflows_ci_pr_size_yml" {
  commit_author       = module.constants.committer.name
  commit_email        = module.constants.committer.email
  repository          = github_repository.template_repo.name
  branch              = github_repository.template_repo.default_branch
  file                = ".github/workflows/ci-pr-size.yml"
  content             = file("dot-github/workflows/ci-pr-size.yml")
  commit_message      = "Update \"CI (PR size)\" GHA workflow"
  overwrite_on_create = true
}

resource "github_repository_file" "template_repo_dot_github_workflows_ci_scheduled_yml" {
  commit_author       = module.constants.committer.name
  commit_email        = module.constants.committer.email
  repository          = github_repository.template_repo.name
  branch              = github_repository.template_repo.default_branch
  file                = ".github/workflows/ci-scheduled.yml"
  content             = file("dot-github/workflows/ci-scheduled.yml")
  commit_message      = "Update \"CI (scheduled)\" GHA workflow"
  overwrite_on_create = true
}

resource "github_repository_file" "template_repo_dot_github_workflows_ci_website_yml" {
  commit_author       = module.constants.committer.name
  commit_email        = module.constants.committer.email
  repository          = github_repository.template_repo.name
  branch              = github_repository.template_repo.default_branch
  file                = ".github/workflows/ci-website.yml"
  content             = file("dot-github/workflows/ci-website.yml")
  commit_message      = "Update \"CI (website)\" GHA workflow"
  overwrite_on_create = true
}

resource "github_repository_file" "template_repo_dot_github_workflows_ci_yml" {
  commit_author       = module.constants.committer.name
  commit_email        = module.constants.committer.email
  repository          = github_repository.template_repo.name
  branch              = github_repository.template_repo.default_branch
  file                = ".github/workflows/ci.yml"
  content             = file("dot-github/workflows/ci.yml")
  commit_message      = "Update \"CI\" GHA workflow"
  overwrite_on_create = true
}

resource "github_repository_file" "template_repo_dot_github_workflows_publish_package_yml" {
  commit_author       = module.constants.committer.name
  commit_email        = module.constants.committer.email
  repository          = github_repository.template_repo.name
  branch              = github_repository.template_repo.default_branch
  file                = ".github/workflows/publish-package.yml"
  content             = file("dot-github/workflows/publish-package.yml")
  commit_message      = "Update \"Publish package\" GHA workflow"
  overwrite_on_create = true
}

resource "github_repository_file" "template_repo_dot_github_workflows_publish_release_yml" {
  commit_author       = module.constants.committer.name
  commit_email        = module.constants.committer.email
  repository          = github_repository.template_repo.name
  branch              = github_repository.template_repo.default_branch
  file                = ".github/workflows/publish-release.yml"
  content             = file("dot-github/workflows/publish-release.yml")
  commit_message      = "Update \"Publish release\" GHA workflow"
  overwrite_on_create = true
}

resource "github_repository_file" "template_repo_dot_github_workflows_publish_website_yml" {
  commit_author       = module.constants.committer.name
  commit_email        = module.constants.committer.email
  repository          = github_repository.template_repo.name
  branch              = github_repository.template_repo.default_branch
  file                = ".github/workflows/publish-website.yml"
  content             = file("dot-github/workflows/publish-website.yml")
  commit_message      = "Update \"Publish website\" GHA workflow"
  overwrite_on_create = true
}
