output "instance_id" {
  description = "ID of VM instance"
  value       = yandex_compute_instance.my_vm.id
}

output "instance_created_at" {
  description = "Time at which VM was created"
  value       = yandex_compute_instance.my_vm.created_at
}