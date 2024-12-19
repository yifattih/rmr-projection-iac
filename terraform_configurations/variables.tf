variable "gcp" {
  type        = map(string)
  description = "Map with Google Cloud Platform project settings."
}

variable "api_service" {
  type = map(string)
  description = "Map with service settings"  
}

variable "client_service" {
  type = map(string)
  description = "Map with service settings"  
}