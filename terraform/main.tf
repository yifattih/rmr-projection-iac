module "api_service" {
  source          = "./modules/cloud_run"
  project_id      = var.project_id
  region          = var.region
  name            = var.api_service_name
  environment     = var.api_environment
  image_name_tag  = var.api_image_name_tag
  container_port  = var.api_container_port
}

module "webapp_service" {
  source          = "./modules/cloud_run"
  project_id      = var.project_id
  region          = var.region
  name            = var.client_service_name
  environment     = var.client_environment
  image_name_tag  = var.client_image_name_tag
  container_port  = var.client_container_port
  env_vars        = { API_URL = "${module.api_service.url}" }
}