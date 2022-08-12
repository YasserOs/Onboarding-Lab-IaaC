resource "google_container_cluster" "GKE" {
  name     = var.cluster_name
  project = var.project
  location = var.cluster_region
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = var.vpc-selflink
  subnetwork               = var.subnet-selflink

  node_locations = var.cluster_zones
  master_authorized_networks_config {
      
      cidr_blocks{
          cidr_block = var.authorized-cidr-range
          display_name = "authorized"
      }

  }
  ip_allocation_policy {
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "192.168.1.0/28"
  }
}

resource "google_container_node_pool" "nodePool" {
  name       = var.node-pool-name
  location   = var.cluster_region
  cluster    = google_container_cluster.GKE.name
  node_count = var.nodes-count

  node_config {
    preemptible  = true
    machine_type = var.node-type
    image_type = var.os-image
    disk_size_gb = var.disk-size
    disk_type = var.disk-type
    service_account = var.sa
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}