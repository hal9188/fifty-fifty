resource "google_artifact_registry_repository" "this" {
  project       = var.project
  location      = var.region
  repository_id = var.repository_id
  description   = var.description
  format        = "DOCKER"

  lifecycle {
    prevent_destroy = true
  }

  dynamic "cleanup_policies" {
    for_each = var.keep_count != null ? [1] : []
    content {
      id     = "keep-minimum-versions"
      action = "KEEP"

      most_recent_versions {
        keep_count = var.keep_count
      }
    }
  }

  dynamic "cleanup_policies" {
    for_each = var.retention_days != null ? [1] : []
    content {
      id     = "cleanup-aged-image"
      action = "DELETE"

      condition {
        tag_state  = "ANY"
        older_than = var.retention_days
      }
    }
  }
}