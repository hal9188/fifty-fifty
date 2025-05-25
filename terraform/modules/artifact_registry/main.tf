resource "google_artifact_registry_repository" "this" {
  project       = var.project
  location      = var.region
  repository_id = var.repository_id
  description   = var.description
  format        = "DOCKER"

  cleanup_policies {
    id     = "cleanup-aged-image"
    action = "DELETE"

    condition {
      tag_state  = "ANY"
      older_than = var.retention_days
    }
  }
}