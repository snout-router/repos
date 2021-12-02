module "repo_terraform_test" {
  source      = "./modules/repo"
  name        = "terraform-test"
  description = "A test repository created by Terraform"

  has_website = true
}

module "repo_branding" {
  source      = "./modules/repo"
  name        = "branding"
  description = "Branding assets for Snout"
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

module "repo_tsconfig" {
  source      = "./modules/repo"
  name        = "tsconfig"
  description = "The TypeScript configuration used by Snout repositories"
}
