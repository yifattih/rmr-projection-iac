module "artifact_registry" {
  source                 = "./modules/artifact_registry"
  project_id             = var.project_id
  region                 = var.region
  artifact_registry_name = var.artifact_registry_name
}

module "cloud_run_services" {
  source          = "./modules/cloud_run"
  project_id      = var.project_id
  region          = var.region
  service_names   = var.service_names
  image_repo_url  = var.image_repo_url
  image_name_tags = var.image_name_tags
}