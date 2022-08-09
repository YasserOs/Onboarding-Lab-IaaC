terraform {
  backend "gcs" {
    bucket  = "yasser-statefile-bucket"
    prefix = "terraform/state"
  }
}
provider "google" {
  project     = "iti-2-358616"
  region      = "us-central1"
} 