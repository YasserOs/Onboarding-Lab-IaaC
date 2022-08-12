resource "google_compute_subnetwork" "demo-subnet" {
  name          = var.Subnet_name
  ip_cidr_range = var.Subnet_cidr
  region        = var.Subnet_region
  network       = var.network-id
  private_ip_google_access = var.private_google_access
}
