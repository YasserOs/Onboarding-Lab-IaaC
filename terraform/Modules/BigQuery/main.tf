resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = var.dataset-id
  friendly_name               = var.friendly-name
  description                 = "This is a test description"
  location                    = var.location
  default_table_expiration_ms = 3600000
  access {
    role          = var.dataset-role
    user_by_email = var.authorized-member
  }

}
