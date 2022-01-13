module "repo_branding" {
  source        = "./modules/repo"
  commit_author = local.commit_author
  commit_email  = local.commit_email
  license       = local.license
  template      = local.template
  primary_url   = local.primary_url
  name          = "branding"
  description   = "Branding assets for Snout"

  has_ci = false
}

module "repo_docusaurus_config" {
  source        = "./modules/repo"
  commit_author = local.commit_author
  commit_email  = local.commit_email
  license       = local.license
  template      = local.template
  primary_url   = local.primary_url
  name          = "docusaurus-config"
  description   = "The Docusaurus configuration used by Snout repositories"

  has_ci = false
}

module "repo_eslint_config" {
  source        = "./modules/repo"
  commit_author = local.commit_author
  commit_email  = local.commit_email
  license       = local.license
  primary_url   = local.primary_url
  name          = "eslint-config"
  description   = "The ESLint configuration used by Snout repositories"

  has_ci = false
}

module "repo_eslint_config_react" {
  source        = "./modules/repo"
  commit_author = local.commit_author
  commit_email  = local.commit_email
  license       = local.license
  template      = local.template
  primary_url   = local.primary_url
  name          = "eslint-config-react"
  description   = "The ESLint configuration used by Snout repositories that use React"

  has_ci = false
}

module "repo_jest_config" {
  source        = "./modules/repo"
  commit_author = local.commit_author
  commit_email  = local.commit_email
  license       = local.license
  template      = local.template
  primary_url   = local.primary_url
  name          = "jest-config"
  description   = "The Jest configuration used by Snout repositories"

  has_ci = false
}

module "repo_regexp" {
  source        = "./modules/repo"
  commit_author = local.commit_author
  commit_email  = local.commit_email
  license       = local.license
  template      = local.template
  primary_url   = local.primary_url
  name          = "regexp"
  description   = "Utility functions for working with regular expressions"

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
  source        = "./modules/repo"
  commit_author = local.commit_author
  commit_email  = local.commit_email
  license       = local.license
  template      = local.template
  primary_url   = local.primary_url
  name          = "router-path"
  description   = "A simple, light-weight, type-safe router path implementation"

  topics = [
    "path",
    "route",
    "router",
    "routing",
  ]

  has_website = true
}

module "repo_router_path_extras" {
  source        = "./modules/repo"
  commit_author = local.commit_author
  commit_email  = local.commit_email
  license       = local.license
  template      = local.template
  primary_url   = local.primary_url
  name          = "router-path-extras"
  description   = "Additional parameter types for Snout router path"

  topics = [
    "path",
    "route",
    "router",
    "routing",
  ]

  has_website            = true
  should_publish_website = false
}

module "repo_tsconfig" {
  source        = "./modules/repo"
  commit_author = local.commit_author
  commit_email  = local.commit_email
  license       = local.license
  template      = local.template
  primary_url   = local.primary_url
  name          = "tsconfig"
  description   = "The TypeScript configuration used by Snout repositories"

  has_ci = false
}
