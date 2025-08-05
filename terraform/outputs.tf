output "instance_name" {
  description = "Name of the created VM instance"
  value       = google_compute_instance.ubuntu_vm.name
}

output "instance_ip" {
  description = "External IP address of the VM instance"
  value       = google_compute_instance.ubuntu_vm.network_interface[0].access_config[0].nat_ip
}