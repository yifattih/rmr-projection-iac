resource "google_cloud_run_service" "service" {
  project  = var.project_id
  location = var.region
  name     = var.name

  # Service template definition
  template {
    metadata {
      annotations = {
        "autoscaling.knative.dev/minScale" = "1" # Minimum instances
        "autoscaling.knative.dev/maxScale" = "10" # Maximum instances
        "run.googleapis.com/revision-suffix" = var.revision_suffix
      }
      labels     = {
        # Labels for identifying your service
        "env" = var.environment
        "app" = var.project_id
      }
    }
    
    spec {
      # Define container
      containers {
        name  = var.name
        image = var.image_uri
        ports {
          name           = "http1"
          container_port = var.container_port
        }
        env {
          name  = var.env_vars != {} ? "API_URL" : null
          value = lookup(var.env_vars, "API_URL", null)
        }
      }
      # service_account_name = var.service_account
    }
  }
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