resource "google_cloud_run_service_iam_member" "unauthenticated_invoker" {
  location = var.location
  project  = var.project
  service  = google_cloud_run_v2_service.this.name

  role   = "roles/run.invoker"
  member = "allUsers"
}