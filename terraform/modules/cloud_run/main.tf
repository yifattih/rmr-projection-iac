 # Service template definition
resource "google_cloud_run_service" "service" {
  project  = var.project_id
  location = var.region
  name     = var.name

  template {
    metadata {
      annotations = {
        "autoscaling.knative.dev/minScale" = "0" # Minimum instances
        "autoscaling.knative.dev/maxScale" = "10" # Maximum instances
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
        image =  "${var.region}-docker.pkg.dev/${var.project_id}/${var.environment}/${var.image_name_tag}"
        ports {
          name           = "http1"
          container_port = var.container_port
        }
        env {
          name  = length(var.env_vars) != 0 ? "API_URL" : "none"
          value = lookup(var.env_vars, "API_URL", null)
        }
        resources {
          limits = {
            memory = "256Mi"
            cpu = "1"
          }
        }
      }
      service_account_name = var.service_account_name
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