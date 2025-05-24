resource "google_cloud_run_v2_service" "this" {
  name                       = var.service_name
  location                   = var.region
  deletion_protection        = var.deletion_protection

  template {
    containers {
      image = var.image

      resources {
        limits = {
          "cpu" = "1"
          "memory" = "512Mi"
        }
        startup_cpu_boost = true
      }
    }
    max_instance_request_concurrency = 1
    scaling {
      max_instance_count = 1
    }
  }
}