# module "iam" {
#   source     = "./modules/iam"
#   project_id = 577926260607
#   region     = var.region
# }

module "api_service" {
  source             = "./modules/cloud_run"
  name               = "api-service"
  project_id         = var.project_id
  region             = var.region
  artifact_repo_name = var.artifact_registry_repo
  image_name         = var.api_image_name
  image_tag          = var.api_image_tag
  # service_account    = module.iam.service_account_email
  env_vars           = {}
  # traffic_split      = var.traffic_split
}

module "webapp_service" {
  source             = "./modules/cloud_run"
  name               = "webapp-service"
  project_id         = var.project_id
  region             = var.region
  artifact_repo_name = var.artifact_registry_repo
  image_name         = var.webapp_image_name
  image_tag          = var.webapp_image_tag
  # service_account    = module.iam.service_account_email
  env_vars           = { API_URL = module.api_service.url }
  # traffic_split      = var.traffic_split
}