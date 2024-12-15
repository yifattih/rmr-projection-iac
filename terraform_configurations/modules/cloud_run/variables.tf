variable "name" {
  type        = string
  description = "The name of the Cloud Run service."
}

variable "project_id" {
  type        = string
  description = "The ID of the GCP project."
}

variable "region" {
  type        = string
  description = "The GCP region for the Cloud Run service."
}

variable "artifact_repo_name" {
  type        = string
  description = "Name of the Artifact Registry repository."
}

variable "image_name" {
  type        = string
  description = "Name of the container image."
}

variable "image_tag" {
  type        = string
  description = "Tag of the container image."
}

variable "service_account" {
  type        = string
  description = "The service account email for the Cloud Run service."
}

variable "env_vars" {
  type        = map(string)
  description = "Environment variables for the service."
  default     = {}
}

variable "traffic_split" {
  type        = map(string)
  description = "Map of service revisions and their traffic split percentages."
  default     = {}
}