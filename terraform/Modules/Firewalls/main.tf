resource "google_compute_firewall" "rule" {
  name    = var.firewall-rule-name
  network = var.network_id

  allow {
    protocol = var.firewall-rule-protocol
    ports    = var.firewall-rule-ports
  }
  source_ranges = var.source_ranges

}