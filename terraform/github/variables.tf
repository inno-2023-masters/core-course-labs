variable "github_token" {
  description = "My Github token"
  type        = string
  sensitive   = true
}


variable "github_owner" {
  description = "My Github owner"
  type        = string
  default     = "devops-organizational"
}
