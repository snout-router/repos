locals {
  template = {
    owner      = local.owner
    repository = github_repository.template_repo.name
  }
}

# Unique repositories ==========================================================

resource "github_repository" "dot_github" {
  lifecycle {
    prevent_destroy = true
  }

  name         = ".github"
  description  = "The community health files for the Snout organization"
  homepage_url = local.primary_url

  has_issues   = false
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true
  vulnerability_alerts   = true
}

resource "github_repository" "dot_github_dot_io" {
  lifecycle {
    prevent_destroy = true
  }

  name         = "${local.owner}.github.io"
  description  = "The Snout website"
  homepage_url = local.primary_url

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
    cname = local.primary_domain
    source {
      branch = "main"
    }
  }
}

resource "github_repository" "template_repo" {
  lifecycle {
    prevent_destroy = true
  }

  name         = "template-repo"
  description  = "A template repo for Snout TypeScript projects"
  homepage_url = local.primary_url

  has_projects = false
  has_wiki     = false
  is_template  = true

  delete_branch_on_merge = true
  vulnerability_alerts   = true
}

# Cookie-cutter repositories ===================================================

module "repo_branding" {
  source      = "./modules/repo"
  template    = local.template
  primary_url = local.primary_url
  name        = "branding"
  description = "Branding assets for Snout"
}

module "repo_docusaurus_config" {
  source      = "./modules/repo"
  template    = local.template
  primary_url = local.primary_url
  name        = "docusaurus-config"
  description = "The Docusaurus configuration used by Snout repositories"
}

module "repo_eslint_config" {
  source      = "./modules/repo"
  primary_url = local.primary_url
  name        = "eslint-config"
  description = "The ESLint configuration used by Snout repositories"
}

module "repo_eslint_config_react" {
  source      = "./modules/repo"
  template    = local.template
  primary_url = local.primary_url
  name        = "eslint-config-react"
  description = "The ESLint configuration used by Snout repositories that use React"
}

module "repo_jest_config" {
  source      = "./modules/repo"
  template    = local.template
  primary_url = local.primary_url
  name        = "jest-config"
  description = "The Jest configuration used by Snout repositories"
}

module "repo_regexp" {
  source      = "./modules/repo"
  template    = local.template
  primary_url = local.primary_url
  name        = "regexp"
  description = "Utility functions for working with regular expressions"

  topics = [
    "escape",
    "escaping",
    "regex",
    "regexp",
    "regular-expression",
    "regular-expressions",
  ]

  has_website = true
}

module "repo_router_path" {
  source      = "./modules/repo"
  template    = local.template
  primary_url = local.primary_url
  name        = "router-path"
  description = "A simple, light-weight, type-safe router path implementation"

  topics = [
    "path",
    "route",
    "router",
    "routing",
  ]

  has_website = true
}

module "repo_router_path_extras" {
  source      = "./modules/repo"
  template    = local.template
  primary_url = local.primary_url
  name        = "router-path-extras"
  description = "Additional parameter types for Snout router path"

  topics = [
    "path",
    "route",
    "router",
    "routing",
  ]

  has_website = true
}

module "repo_tsconfig" {
  source      = "./modules/repo"
  template    = local.template
  primary_url = local.primary_url
  name        = "tsconfig"
  description = "The TypeScript configuration used by Snout repositories"
}
