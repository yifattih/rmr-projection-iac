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
  project = "your-gcp-project-id"
  region  = "your-gcp-region"
}