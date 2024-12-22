terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.13.0"
    }
  }
}

provider "google" {
  project = var.gcp_data["project_id"]
  region  = var.gcp_data["region"]
}
# provider "google" {
#   project = var.project_id
#   region  = var.region
# }