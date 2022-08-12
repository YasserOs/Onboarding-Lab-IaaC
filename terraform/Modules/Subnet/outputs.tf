output "subnet-region" {
  value = google_compute_subnetwork.demo-subnet.region
}

output "subnet-id" {
   value = google_compute_subnetwork.demo-subnet.id
}

output "subnet-selflink" {
  value = google_compute_subnetwork.demo-subnet.self_link
}