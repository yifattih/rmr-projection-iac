###############################################################################
################################ BLUE SERVICES ################################
module "api_service_blue" {
  source               = "./modules/cloud_run"
  project_id           = var.project_id
  region               = var.region
  name                 = "${var.api_service_name}-blue"
  environment          = var.api_environment
  image_name_tag       = var.api_image_name_tag
  container_port       = var.api_container_port
  service_account_name = var.service_account_name
}

module "client_service_blue" {
  source               = "./modules/cloud_run"
  project_id           = var.project_id
  region               = var.region
  name                 = "${var.client_service_name}-blue"
  environment          = var.client_environment
  image_name_tag       = var.client_image_name_tag
  container_port       = var.client_container_port
  env_vars             = { API_URL = "${module.api_service_blue.url}" }
  service_account_name = var.service_account_name
}

###############################################################################
############################### GREEN SERVICES ################################
module "api_service_green" {
  source               = "./modules/cloud_run"
  project_id           = var.project_id
  region               = var.region
  name                 = "${var.api_service_name}-green"
  environment          = var.api_environment
  image_name_tag       = var.api_image_name_tag
  container_port       = var.api_container_port
  service_account_name = var.service_account_name
}

module "client_service_green" {
  source               = "./modules/cloud_run"
  project_id           = var.project_id
  region               = var.region
  name                 = "${var.client_service_name}-green"
  environment          = var.client_environment
  image_name_tag       = var.client_image_name_tag
  container_port       = var.client_container_port
  env_vars             = { API_URL = "${module.api_service_green.url}" }
  service_account_name = var.service_account_name
}