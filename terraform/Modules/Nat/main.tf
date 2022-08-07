resource "google_compute_router" "router" {
  name    = var.router-name
  region  = var.router-region
  network = var.router-network
}

resource "google_compute_router_nat" "nat" {
  name                               = "my-router-nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

// specifying list of subnetworks to be nat-ed
   subnetwork { 
    name                    =  var.subnet-id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}