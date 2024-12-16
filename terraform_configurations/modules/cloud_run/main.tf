resource "google_cloud_run_service" "service" {
  name     = var.name
  location = var.region
  project  = var.project_id

  # Service template definition
  template {
    metadata {
      annotations = {
        "autoscaling.knative.dev/minScale" = "1" # Minimum instances
        "autoscaling.knative.dev/maxScale" = "10" # Maximum instances
      }
      labels     = {
        # Labels for identifying your service
        "env" = "production"
        "app" = "rmr-projection"
      }
    }
    
    spec {
      # Define container
      containers {
        name  = "${var.image_name}-${var.image_tag}"
        image = "${var.region}-docker.pkg.dev/${var.project_id}/${var.artifact_repo_name}/${var.image_name}:${var.image_tag}" # Docker image URL
        ports {
          name           = "http1"
          container_port = var.port # Replace with your desired container port
        }
        env {
          name  = var.env_vars != {} ? "API_URL" : null
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

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.service.location
  project     = google_cloud_run_service.service.project
  service     = google_cloud_run_service.service.name

  policy_data = data.google_iam_policy.noauth.policy_data
}