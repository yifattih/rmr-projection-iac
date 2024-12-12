variable "project_id" {
    description = "GCP Project ID"
    type        = string  
}

variable "region" {
    description = "GCP Region for Cloud Run"
    type        = string
}

variable "artifact_registry_name" {
  description = "Name of the Artifact Registry"
  type        = string
}