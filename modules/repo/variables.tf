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

variable "from_template" {
  description = "Whether the repo should be created from the standard snout-router template"
  type        = bool
  default     = true
}

variable "has_website" {
  description = "Whether the repository has a website"
  type        = bool
  default     = false
}
