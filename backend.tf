terraform {
  backend "remote" {
    organization = "snout-router"

    workspaces {
      name = "repos"
    }
  }
}
