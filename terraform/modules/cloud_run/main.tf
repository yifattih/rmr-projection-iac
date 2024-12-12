resource "google_cloud_run_service" "service" {
  for_each = toset(var.service_names)

  name     = each.key
  project  = var.project_id
  location = var.region

  template {
    spec {
      containers {
        image = "${var.image_repo_url}/${var.image_name_tags[each.key]}"
      }
    }
  }
}