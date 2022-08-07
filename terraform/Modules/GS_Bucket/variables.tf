variable "bucket_name" {
  description = "The gcs bucket name which holds the state file"
  type        = string
}

variable "storage_class" {
  description = "The gcs bucket class "
  type        = string
  default = "STANDARD"
}

variable "location" {
  description = "The gcs bucket class "
  type        = string
}