resource "google_compute_instance" "test-vm"{
  name         = var.Machine_name
  machine_type = var.Machine_type
  zone         = var.Zone
  allow_stopping_for_update = true
  boot_disk {
    initialize_params {
      image = var.OS_image
    }
  }

  network_interface {
    subnetwork = var.subnet-id
  }

    service_account {
      scopes = ["cloud-platform"]
      email = var.sa-email
    }
}