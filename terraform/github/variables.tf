variable "github_token" {
  description = "Github token"
  type        = string
  sensitive   = true
}


variable "github_owner" {
  description = "Github owner"
  type        = string
  default     = "my-cute-organization"
}
