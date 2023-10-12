resource "github_repository_file" "dot_github_dependabot_yml" {
  count = 1

  commit_author       = module.constants.committer.name
  commit_email        = module.constants.committer.email
  repository          = github_repository.this.name
  file                = ".github/dependabot.yml"
  commit_message      = "Update Dependabot configuration"
  overwrite_on_create = true

  content = templatefile(
    "dot-github/dependabot.yml.tftpl",
    {
      has_npm_website = var.has_website && var.should_publish_website
    }
  )
}
