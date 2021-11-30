terraform {
  required_version = ">= 1.0.11"

  backend "remote" {
    organization = "snout-router"

    workspaces {
      name = "repos"
    }
  }
}
