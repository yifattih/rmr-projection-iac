resource "google_cloud_run_service" "service" {
  name     = var.name
  location = var.region
  template {
    spec {
      containers {
        image = "${var.region}-docker.pkg.dev/${var.project_id}/${var.artifact_repo_name}/${var.image_name}:${var.image_tag}"
        env {
          name  = "API_URL"
          value = lookup(var.env_vars, "API_URL", null)
        }
      }
      # service_account_name = var.service_account
    }
  }
  # dynamic "traffic" {
  #   for_each = var.traffic_split
  #   content {
  #     revision_name = each.key
  #     percent       = each.value
  #   }
  # }
}

resource "google_cloud_run_service_iam_binding" "invoker" {
  location    = var.region
  service     = google_cloud_run_service.service.name
  role        = "roles/run.invoker"
  members     = [ "allUsers" ]
}