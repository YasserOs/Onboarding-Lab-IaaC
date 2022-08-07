output "instance-ip" {
  value = google_compute_instance.test-vm.network_interface.0.network_ip
}