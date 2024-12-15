# resource "google_service_account" "cloud_run_sa" {
#   account_id   = "rmr-projection-sa"
#   display_name = "Shared RMR Projection Project Service Account"
#   create_ignore_already_exists = true
# }

# resource "google_project_iam_member" "artifact_registry_reader" {
#   project = var.project_id
#   role    = "roles/artifactregistry.reader"
#   member  = "serviceAccount:${google_service_account.cloud_run_sa.email}"
# }