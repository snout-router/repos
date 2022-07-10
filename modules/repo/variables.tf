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

variable "homepage_url" {
  description = "The repository homepage URL"
  type        = string
  default     = ""
}

variable "template" {
  description = "The template repo to use"
  type        = object({ owner = string, repository = string })
  default     = null
}

variable "has_size_limit" {
  description = "Whether the repository uses size-limit"
  type        = bool
  default     = false
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
