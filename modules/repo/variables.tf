module "constants" {
  source = "../constants"
}

variable "name" {
  description = "The repository name"
  type        = string
}

variable "description" {
  description = "The repository description"
  type        = string
}

variable "topics" {
  description = "The repository topics"
  type        = list(string)
  default     = []
}

variable "template" {
  description = "The template repo to use"
  type        = object({ owner = string, repository = string })
  default     = null
}

variable "has_ci" {
  description = "Whether the repository has a CI setup"
  type        = bool
  default     = true
}

variable "has_website" {
  description = "Whether the repository has a website"
  type        = bool
  default     = false
}

variable "should_publish_website" {
  description = "Whether the website should be published via GHA"
  type        = bool
  default     = true
}

variable "release_make_target" {
  description = "The make target to run before publishing releases"
  type        = string
  default     = ""
}
