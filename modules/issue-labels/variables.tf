module "constants" {
  source = "../constants"
}

variable "repository" {
  description = "The repository name"
  type        = string
}
