provider "google" {
  project = var.project
  region  = var.region
}

module "fifty_fifty" {
  source        = "../../modules/cloud_run_service"
  service_name  = "${var.service_name}-prod"
  region        = var.region
  location      = var.region
  project       = var.project
  image         = var.image
}