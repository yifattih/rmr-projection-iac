variable "gcp_data" {
  type = map(string)  
}

# variable "project_id" {
#   type = string  
# }

# variable "region" {
#   type = string
# }

variable "api_service_name" {
  type = string
}

variable "api_environment" {
  type = string
}

variable "api_image_name_tag" {
  type = string
}

variable "api_container_port" {
  type = number
}

variable "client_service_name" {
  type = string
}

variable "client_environment" {
  type = string
}

variable "client_image_name_tag" {
  type = string
}

variable "client_container_port" {
  type = number
}

variable "service_account_name" {
  type = string 
}

# variable "bucket_name" {
#   type = string
# }

# variable "bucket_prefix" {
#   type = string
# }