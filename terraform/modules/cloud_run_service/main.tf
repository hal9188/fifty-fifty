resource "google_cloud_run_service" "this" {
  name                       = var.service_name
  location                   = var.region
  autogenerate_revision_name = true # 自動でリビジョン末尾の識別文字列を入れるために必要

  template {
    spec {
      containers {
        image = var.image
      }
    }
  }
}