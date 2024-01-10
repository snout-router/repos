locals {
  issue_label_color_renovate          = "0366d6"
  issue_label_color_renovate_safe     = "168700"
  issue_label_color_renovate_unsafe   = "d93f0b"
  issue_label_color_renovate_security = "d73a4a"
}

resource "github_issue_labels" "this" {
  repository = var.repository

  label {
    name        = "renovate"
    description = "Pull requests created by Renovate"
    color       = local.issue_label_color_renovate
  }

  label {
    name        = "docker"
    description = "Pull requests that update Docker dependencies"
    color       = local.issue_label_color_renovate
  }

  label {
    name        = "github-actions"
    description = "Pull requests that update GitHub Actions dependencies"
    color       = local.issue_label_color_renovate
  }

  label {
    name        = "gomod"
    description = "Pull requests that update gomod dependencies"
    color       = local.issue_label_color_renovate
  }

  label {
    name        = "gradle"
    description = "Pull requests that update Gradle dependencies"
    color       = local.issue_label_color_renovate
  }

  label {
    name        = "helm"
    description = "Pull requests that update Helm dependencies"
    color       = local.issue_label_color_renovate
  }

  label {
    name        = "npm"
    description = "Pull requests that update NPM dependencies"
    color       = local.issue_label_color_renovate
  }

  label {
    name        = "nuget"
    description = "Pull requests that update NuGet dependencies"
    color       = local.issue_label_color_renovate
  }

  label {
    name        = "swift"
    description = "Pull requests that update Swift dependencies"
    color       = local.issue_label_color_renovate
  }

  label {
    name        = "terraform"
    description = "Pull requests that update Terraform dependencies"
    color       = local.issue_label_color_renovate
  }

  label {
    name        = "major"
    description = "Pull requests that update major dependency versions"
    color       = local.issue_label_color_renovate_unsafe
  }

  label {
    name        = "non-major"
    description = "Pull requests that update non-major dependency versions"
    color       = local.issue_label_color_renovate_safe
  }

  label {
    name        = "non-dev"
    description = "Pull requests that update non-dev dependencies"
    color       = local.issue_label_color_renovate_unsafe
  }

  label {
    name        = "dev"
    description = "Pull requests that update dev dependencies"
    color       = local.issue_label_color_renovate_safe
  }

  label {
    name        = "trusted"
    description = "Pull requests that update trusted dependencies"
    color       = local.issue_label_color_renovate_safe
  }

  label {
    name        = "security"
    description = "Pull requests that address security vulnerabilities"
    color       = local.issue_label_color_renovate_security
  }
}
