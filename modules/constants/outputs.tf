locals {
  primary_domain = "snout.dev"
  primary_url    = "https://${local.primary_domain}"
}

output "committer" {
  description = "The committer details to use when comitting files to GitHub"
  value = {
    name  = "snout-router-repo-manager[bot]"
    email = "97502368+snout-router-repo-manager[bot]@users.noreply.github.com"
  }
}

output "license" {
  description = "The repository license"
  value       = file("LICENSE")
}

output "org" {
  description = "The GitHub organization"
  value       = "snout-router"
}

output "primary_domain" {
  description = "The primary organization domain"
  value       = local.primary_domain
}

output "primary_url" {
  description = "The primary URL for websites"
  value       = local.primary_url
}
