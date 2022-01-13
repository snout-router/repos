resource "github_repository_file" "license" {
  commit_author       = var.commit_author
  commit_email        = var.commit_email
  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = "LICENSE"
  content             = var.license
  commit_message      = "Update license"
  overwrite_on_create = true
}
