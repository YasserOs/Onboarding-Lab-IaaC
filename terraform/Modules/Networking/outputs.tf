output "vpc_id" {
    value = google_compute_network.vpc_network.id
  
}

output "vpc-selflink" {
  value = google_compute_network.vpc_network.self_link
}

