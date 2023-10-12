locals {
  issue_label_color_renovate        = "0366D6"
  issue_label_color_renovate_safe   = "168700"
  issue_label_color_renovate_unsafe = "D93F0B"
}

resource "github_issue_label" "renovate" {
  repository  = var.repository
  name        = "renovate"
  description = "Pull requests created by Renovate"
  color       = local.issue_label_color_renovate
}

resource "github_issue_label" "github_actions" {
  repository  = var.repository
  name        = "github-actions"
  description = "Pull requests that update GitHub Actions dependencies"
  color       = local.issue_label_color_renovate
}

resource "github_issue_label" "npm" {
  repository  = var.repository
  name        = "npm"
  description = "Pull requests that update NPM dependencies"
  color       = local.issue_label_color_renovate
}

resource "github_issue_label" "terraform" {
  repository  = var.repository
  name        = "terraform"
  description = "Pull requests that update Terraform dependencies"
  color       = local.issue_label_color_renovate
}

resource "github_issue_label" "major" {
  repository  = var.repository
  name        = "major"
  description = "Pull requests that update major dependency versions"
  color       = local.issue_label_color_renovate_unsafe
}

resource "github_issue_label" "non_major" {
  repository  = var.repository
  name        = "non-major"
  description = "Pull requests that update non-major dependency versions"
  color       = local.issue_label_color_renovate_safe
}

resource "github_issue_label" "non_dev" {
  repository  = var.repository
  name        = "non-dev"
  description = "Pull requests that update non-dev dependencies"
  color       = local.issue_label_color_renovate_unsafe
}

resource "github_issue_label" "dev" {
  repository  = var.repository
  name        = "dev"
  description = "Pull requests that update dev dependencies"
  color       = local.issue_label_color_renovate_safe
}
