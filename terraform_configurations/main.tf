module "iam" {
  source     = "./modules/iam"
  project_id = var.gcp["project_id"]
  region     = var.gcp["region"]
}

module "api_service" {
  source             = "./modules/cloud_run"
  project_id         = var.gcp["project_id"]
  region             = var.gcp["region"]
  name               = var.api_service["name"]
  revision_suffix    = var.api_service["revision_suffix"]
  environment        = var.api_service["environment"]
  image_uri          = var.api_service["image_uri"]
  container_port     = var.api_service["container_port"]
}

module "webapp_service" {
  source             = "./modules/cloud_run"
  project_id         = var.gcp["project_id"]
  region             = var.gcp["region"]
  name               = var.client_service["name"]
  revision_suffix    = var.client_service["revision_suffix"]
  environment        = var.client_service["environment"]
  image_uri          = var.client_service["image_uri"]
  container_port     = var.client_service["container_port"]
  env_vars           = { API_URL = module.api_service.url }
}