locals {
  owner          = "snout-router"
  commit_author  = "snout-router-repo-manager[bot]"
  commit_email   = "97502368+snout-router-repo-manager[bot]@users.noreply.github.com"
  primary_domain = "snout.dev"
  primary_url    = "https://${local.primary_domain}"
  license        = file("LICENSE")
}

variable "GITHUB_APP_ID" {
  type = string
}

variable "GITHUB_APP_INSTALLATION_ID" {
  type = string
}

variable "GITHUB_APP_PEM_FILE" {
  type      = string
  sensitive = true
}
