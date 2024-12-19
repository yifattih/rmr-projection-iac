# module "iam" {
#   source     = "./modules/iam"
#   project_id = var.project_id
#   region     = var.region
# }

module "api_service" {
  source          = "./modules/cloud_run"
  project_id      = var.project_id
  region          = var.region
  name            = var.api_service_name
  revision_suffix = var.api_revision_suffix
  environment     = var.api_environment
  image_uri       = var.api_image_uri
  container_port  = var.api_container_port
}

module "webapp_service" {
  source          = "./modules/cloud_run"
  project_id      = var.project_id
  region          = var.region
  name            = var.client_service_name
  revision_suffix = var.client_revision_suffix
  environment     = var.client_environment
  image_uri       = var.client_image_uri
  container_port  = var.client_container_port
  env_vars        = { API_URL = module.api_service.url }
}