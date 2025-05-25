provider "google" {
  project = var.project
  region  = var.region
}

module "fifty_fifty" {
  source        = "../../modules/cloud_run_service"
  service_name  = var.service_name
  region        = var.region
  location      = var.region
  project       = var.project
  image         = var.image
  deletion_protection = false
}

module "artifact_registry" {
  source        = "../../modules/artifact_registry"
  region        = var.region
  project       = var.project
  repository_id = "${var.service_name}-pr"
  description   = "Docker repository for PR environments"
  retention_days = "30d"
}