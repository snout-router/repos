resource "github_repository_file" "license" {
  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = "LICENSE"
  content             = var.license
  commit_message      = "Update license"
  overwrite_on_create = true
}
