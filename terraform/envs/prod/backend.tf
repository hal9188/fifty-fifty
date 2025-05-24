terraform {
  backend "gcs" {
    bucket  = "terraform-state-natural-nimbus"
    prefix  = "envs/prod"
  }
}