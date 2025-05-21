variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "pipeline_name" {
  type    = string
  default = "fifty-fifty-pipeline"
}

variable "cloud_run_service" {
  type = string
}