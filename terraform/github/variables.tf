variable "github_token" {
  description = "github token"
  type        = string
  sensitive   = true
  default = "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"
}


variable "github_owner" {
  description = "github owner"
  type        = string
  default     = "my-dev-organization"
}