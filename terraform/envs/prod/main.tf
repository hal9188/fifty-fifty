terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

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
}

module "cloud_deploy" {
  source            = "../../modules/cloud_deploy"
  project           = var.project
  region            = var.region
  pipeline_name     = "fifty-fifty-pipeline"
  cloud_run_service = "fifty-fifty"
}