module "repo_terraform_test" {
  source      = "./modules/repo"
  name        = "terraform-test"
  description = "A test repository created by Terraform"
}
