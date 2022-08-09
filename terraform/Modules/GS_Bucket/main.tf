resource "google_storage_bucket" "gcs" {
   name          = var.bucket_name
   storage_class = var.storage_class
   location = var.location
}
resource "google_storage_bucket_iam_binding" "binding" {
  bucket = var.bucket_name
  role = var.bucket-role
  members = var.authorized-members
}