variable "project_id" {
  type        = string
  description = "The ID of the GCP project."
}

variable "region" {
  type        = string
  description = "The GCP region for the Cloud Run service."
}

variable "name" {
  type        = string
  description = "The name of the Cloud Run service."
}

variable "environment" {
  type        = string
  description = "Name of the deployment environment."
}

variable "image_name_tag" {
  type        = string
  description = "The container image uri."
}

variable "container_port" {
  type        = number
  description = "Port number for the container to expose."
}

variable "env_vars" {
  type        = map(string)
  description = "Environment variables for the service."
  default     = {}
}