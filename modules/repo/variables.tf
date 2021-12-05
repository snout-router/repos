variable "license" {
  description = "The repository license"
  type        = string
}

variable "primary_url" {
  description = "The primary URL for websites"
  type        = string
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

variable "has_website" {
  description = "Whether the repository has a website"
  type        = bool
  default     = false
}
