module "repo_terraform_test" {
  source      = "./modules/repo"
  name        = "terraform-test"
  description = "A test repository created by Terraform"

  has_website = true
}

module "repo_eslint_config" {
  source      = "./modules/repo"
  name        = "eslint-config"
  description = "The ESLint configuration used by Snout repositories"

  from_template = false
}
