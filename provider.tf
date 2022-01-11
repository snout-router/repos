terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "github" {
  owner = local.owner

  app_auth {
    id              = var.GITHUB_APP_ID
    installation_id = var.GITHUB_APP_INSTALLATION_ID
    pem_file        = var.GITHUB_APP_PEM_FILE
  }
}
