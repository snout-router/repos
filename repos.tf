module "repo_branding" {
  source      = "./modules/repo"
  name        = "branding"
  description = "Branding assets for Snout"
}

module "repo_docusaurus_config" {
  source      = "./modules/repo"
  name        = "docusaurus-config"
  description = "The Docusaurus configuration used by Snout repositories"
}

module "repo_jest_config" {
  source      = "./modules/repo"
  name        = "jest-config"
  description = "The Jest configuration used by Snout repositories"
}

module "repo_eslint_config" {
  source      = "./modules/repo"
  name        = "eslint-config"
  description = "The ESLint configuration used by Snout repositories"

  from_template = false
}

module "repo_eslint_config_react" {
  source      = "./modules/repo"
  name        = "eslint-config-react"
  description = "The ESLint configuration used by Snout repositories that use React"
}

module "repo_regexp" {
  source      = "./modules/repo"
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
  name        = "tsconfig"
  description = "The TypeScript configuration used by Snout repositories"
}
