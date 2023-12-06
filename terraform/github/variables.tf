variable "token" {
  type        = string
  description = "Specifies the GitHub PAT token or `GITHUB_TOKEN`"
  sensitive   = true
}

variable "github_organization" {
  description = "Name of GitHub organization"
  default     = "i-nafikov-terraform-org"
  type        = string
}
