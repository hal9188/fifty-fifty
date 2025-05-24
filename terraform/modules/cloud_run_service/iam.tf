resource "google_cloud_run_v2_service_iam_member" "invoker" {
  for_each = toset(var.allowed_members)

  project  = google_cloud_run_v2_service.this.project
  location = google_cloud_run_v2_service.this.location
  name     = google_cloud_run_v2_service.this.name
  role     = "roles/run.invoker"
  member   = each.value
}