locals {
  owner          = "snout-router"
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
