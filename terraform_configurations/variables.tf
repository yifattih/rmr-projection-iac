variable "project_id" {
  type        = string
  description = "The ID of the GCP project."
}

variable "region" { 
  type        = string
  description = "The GCP region to deploy resources."
}

variable "artifact_registry_repo" {
  type        = string
  description = "Name of the Artifact Registry repository."
}

variable "api_image_name" {
  type        = string
  description = "Name of the API image in Artifact Registry."
}

variable "api_image_tag" {
  type        = string
  description = "Tag of the API image."
}

variable "webapp_image_name" {
  type        = string
  description = "Name of the webapp image in Artifact Registry."
}

variable "webapp_image_tag" {
  type        = string
  description = "Tag of the webapp image."
}

# variable "port" {
#   type        = number
#   description = "Port number for the container to expose."
# }

# variable "traffic_split" {
#   type        = map(string)
#   description = "Map of service revisions and their traffic split percentages."
#   default     = {}
# }