variable "bucket_name" {
  description = "The gcs bucket name which holds the state file"
  type        = string
}

variable "storage_class" {
  description = "The gcs bucket class "
  type        = string
  default = "STANDARD"
}

variable "bucket-role" {
  type = string
  default = "roles/storage.objectViewer"
}

variable "authorized-members" {
  type = list
  default = ["allAuthenticatedUsers"]
}
variable "location" {
  description = "The gcs bucket class "
  type        = string
}