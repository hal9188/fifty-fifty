terraform {
  backend "gcs" {
    bucket  = "terraform-state-natural-nimbus-prod"
    prefix  = "envs/prod"
  }
}