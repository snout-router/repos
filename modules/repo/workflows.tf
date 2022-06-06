resource "github_repository_file" "dot_github_workflows_ci_pr_size_yml" {
  count = var.has_ci ? 1 : 0

  commit_author       = module.constants.committer.name
  commit_email        = module.constants.committer.email
  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = ".github/workflows/ci-pr-size.yml"
  content             = file("dot-github/workflows/ci-pr-size.yml")
  commit_message      = "Update \"CI (PR size)\" GHA workflow"
  overwrite_on_create = true
}

resource "github_repository_file" "dot_github_workflows_ci_scheduled_yml" {
  count = var.has_ci ? 1 : 0

  commit_author       = module.constants.committer.name
  commit_email        = module.constants.committer.email
  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = ".github/workflows/ci-scheduled.yml"
  content             = file("dot-github/workflows/ci-scheduled.yml")
  commit_message      = "Update \"CI (scheduled)\" GHA workflow"
  overwrite_on_create = true
}

resource "github_repository_file" "dot_github_workflows_ci_website_yml" {
  count = var.has_website && var.should_publish_website ? 1 : 0

  commit_author       = module.constants.committer.name
  commit_email        = module.constants.committer.email
  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = ".github/workflows/ci-website.yml"
  content             = file("dot-github/workflows/ci-website.yml")
  commit_message      = "Update \"CI (website)\" GHA workflow"
  overwrite_on_create = true
}

resource "github_repository_file" "dot_github_workflows_ci_yml" {
  count = var.has_ci ? 1 : 0

  commit_author       = module.constants.committer.name
  commit_email        = module.constants.committer.email
  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = ".github/workflows/ci.yml"
  content             = file("dot-github/workflows/ci.yml")
  commit_message      = "Update \"CI\" GHA workflow"
  overwrite_on_create = true
}

resource "github_repository_file" "dot_github_workflows_publish_package_yml" {
  count = 1

  commit_author       = module.constants.committer.name
  commit_email        = module.constants.committer.email
  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = ".github/workflows/publish-package.yml"
  content             = file("dot-github/workflows/publish-package.yml")
  commit_message      = "Update \"Publish package\" GHA workflow"
  overwrite_on_create = true
}

resource "github_repository_file" "dot_github_workflows_publish_release_yml" {
  count = 1

  commit_author       = module.constants.committer.name
  commit_email        = module.constants.committer.email
  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = ".github/workflows/publish-release.yml"
  content             = file("dot-github/workflows/publish-release.yml")
  commit_message      = "Update \"Publish release\" GHA workflow"
  overwrite_on_create = true
}

resource "github_repository_file" "dot_github_workflows_publish_website_yml" {
  count = var.has_website && var.should_publish_website ? 1 : 0

  commit_author       = module.constants.committer.name
  commit_email        = module.constants.committer.email
  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = ".github/workflows/publish-website.yml"
  content             = file("dot-github/workflows/publish-website.yml")
  commit_message      = "Update \"Publish website\" GHA workflow"
  overwrite_on_create = true
}
