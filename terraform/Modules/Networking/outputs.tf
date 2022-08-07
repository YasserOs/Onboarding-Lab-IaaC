output "vpc_id" {
    value = google_compute_network.vpc_network.id
  
}
output "subnet-region" {
  value = google_compute_subnetwork.demo-subnet.region
}

output "subnet-id" {
   value = google_compute_subnetwork.demo-subnet.id
}
output "vpc-selflink" {
  value = google_compute_network.vpc_network.self_link
}
output "subnet-selflink" {
  value = google_compute_subnetwork.demo-subnet.self_link
}