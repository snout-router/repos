variable "name" {
  description = "The repository name"
  type        = string
}

variable "description" {
  description = "The repository description"
  type        = string
}

variable "has_website" {
  description = "Whether the repository has a website"
  type        = bool
  default     = false
}
