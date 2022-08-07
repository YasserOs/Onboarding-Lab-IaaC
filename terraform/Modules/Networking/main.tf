resource "google_compute_network" "vpc_network" {
  name                    = var.VPC_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "demo-subnet" {
  name          = var.Subnet_name
  ip_cidr_range = var.Subnet_cidr
  region        = var.Subnet_region
  network       = google_compute_network.vpc_network.id
}
