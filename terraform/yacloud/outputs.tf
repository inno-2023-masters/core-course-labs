output "instance_id" {
  description = "VM instance id"
  value       = yandex_compute_instance.compute_instance.id
}

output "instance_created_at" {
  description = "VM creation time"
  value       = yandex_compute_instance.compute_instance.created_at
}