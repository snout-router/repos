module "repo_branding" {
  source       = "./modules/repo"
  template     = local.template
  name         = "branding"
  description  = "Branding assets for Snout"
  homepage_url = "https://github.com/snout-router/branding/releases/latest/download/snout.branding.zip"

  release_make_target = "release"
}

module "repo_docusaurus_config" {
  source      = "./modules/repo"
  template    = local.template
  name        = "docusaurus-config"
  description = "The Docusaurus configuration used by Snout repositories"
}

module "repo_eslint_config" {
  source      = "./modules/repo"
  name        = "eslint-config"
  description = "The ESLint configuration used by Snout repositories"
}

module "repo_eslint_config_react" {
  source      = "./modules/repo"
  template    = local.template
  name        = "eslint-config-react"
  description = "The ESLint configuration used by Snout repositories that use React"
}

module "repo_jest_config" {
  source      = "./modules/repo"
  template    = local.template
  name        = "jest-config"
  description = "The Jest configuration used by Snout repositories"
}

module "repo_regexp" {
  source      = "./modules/repo"
  template    = local.template
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

  has_size_limit = true
  has_website    = true
}

module "repo_router_path" {
  source      = "./modules/repo"
  template    = local.template
  name        = "router-path"
  description = "A simple, light-weight, type-safe router path implementation"

  topics = [
    "path",
    "route",
    "router",
    "routing",
  ]

  has_size_limit = true
  has_website    = true
}

module "repo_router_path_extras" {
  source      = "./modules/repo"
  template    = local.template
  name        = "router-path-extras"
  description = "Additional parameter types for Snout router path"

  topics = [
    "path",
    "route",
    "router",
    "routing",
  ]

  has_size_limit         = true
  has_website            = true
  should_publish_website = false
}

module "repo_tsconfig" {
  source      = "./modules/repo"
  template    = local.template
  name        = "tsconfig"
  description = "The TypeScript configuration used by Snout repositories"
}
