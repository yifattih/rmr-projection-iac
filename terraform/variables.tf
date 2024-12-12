variable "project_id" {
    description = "GCP Project ID"
    type        = string  
}

variable "region" {
    description = "GCP Region for Cloud Run"
    type        = string
}

variable "service_names" {
    description = "List of microservice names"
    type        = list(string)
    default = [ "api", "webapp" ]
}

variable "artifact_registry_name" {
  description = "Name of the Artifact Registry"
  type        = string
}

variable "image_repo_url" {
    description = "URL for the container images repository"
    type        = string  
}

variable "image_name_tags" {
  description = "Tags for the container images"
  type        = map(string)
}