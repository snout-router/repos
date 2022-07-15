terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.26"
    }
  }
}

provider "github" {
  owner = module.constants.org

  app_auth {
    id              = var.GITHUB_APP_ID
    installation_id = var.GITHUB_APP_INSTALLATION_ID
    pem_file        = var.GITHUB_APP_PEM_FILE
  }
}
