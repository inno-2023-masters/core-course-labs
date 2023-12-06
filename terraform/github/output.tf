output "repository_name" {
  description = "Output of the repository name"
  value       = var.repository_name
}

output "default_branch" {
  description = "Output of the default branch"
  value       = var.default_branch
}

output "repository_description" {
  description = "Output of the repository description"
  value       = var.repository_description
}

output "repository_visibility" {
  description = "Output of the repository visibility"
  value       = var.repository_visibility
}

output "repository_require_conversation_resolution" {
  description = "Output of the requirement for conversation resolution"
  value       = var.repository_require_conversation_resolution
}

output "repository_enforce_admins" {
  description = "Output of the enforcement for admins"
  value       = var.repository_enforce_admins
}

output "repository_required_approving_review_count" {
  description = "Output of the required number of approvers"
  value       = var.repository_required_approving_review_count
}
