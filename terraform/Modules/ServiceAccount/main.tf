resource "google_service_account" "sa" {
  account_id = var.sa-id
  display_name = var.sa-display-name
}

resource "google_project_iam_member" "project" {
  project = var.project
  role    = var.role
  member = var.member
}

