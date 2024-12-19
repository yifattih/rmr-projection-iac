# variable "gcp" {
#   type        = map(string)
#   description = "Map with Google Cloud Platform project settings."
# }

# variable "api_service" {
#   type        = map(string)
#   description = "Map with service settings"
# }

# variable "client_service" {
#   type        = map(string)
#   description = "Map with service settings"
# }

variable "project_id" {
  type = string  
}

variable "region" {
  type = string
}

variable "api_service_name" {
  type = string
}

variable "api_revision_suffix" {
  type = string
}

variable "api_environment" {
  type = string
}

variable "api_image_uri" {
  type = string
}

variable "api_container_port" {
  type = number
}

variable "client_service_name" {
  type = string
}

variable "client_revision_suffix" {
  type = string
}

variable "client_environment" {
  type = string
}

variable "client_image_uri" {
  type = string
}

variable "client_container_port" {
  type = number
}