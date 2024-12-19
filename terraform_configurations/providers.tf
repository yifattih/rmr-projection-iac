# providers.tf
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.13.0"
    }
  }
}

provider "google" {
  project = var.gcp["project_id"]
  region  = var.gcp["region"]
}