resource "google_clouddeploy_target" "prod" {
  name     = "prod"
  location = var.region
  project  = var.project

  run {
    location = var.region
    service  = var.cloud_run_service
  }
}

resource "google_clouddeploy_delivery_pipeline" "pipeline" {
  name     = var.pipeline_name
  location = var.region
  project  = var.project

  serial_pipeline {
    stages {
      target_id = google_clouddeploy_target.prod.name
    }
  }
}