variable "repository_name" {
  description = "Repository name"
  type        = string
  default     = "core-course-labs"
}

variable "github_token" {
  description = "Token to access github API"
  type        = string
  default     = "<TOKEN_SHOULD_BE_PLACED_IN_ENV>"
}

variable "default_branch" {
  description = "Default repository branch"
  type        = string
  default     = "main"
}

variable "repository_description" {
  description = "Description for repository"
  type        = string
  default     = "Terraform breaks hearts... and repos :("
}

variable "repository_visibility" {
  description = "Repository visibility"
  type        = string
  default     = "public"
}

variable "repository_require_conversation_resolution" {
  description = "Require conversation resolution"
  type        = bool
  default     = true
}

variable "repository_enforce_admins" {
  description = "Enforce admins"
  type        = bool
  default     = true
}

variable "repository_required_approving_review_count" {
  description = "Number of required appovers"
  type        = number
  default     = 0
}