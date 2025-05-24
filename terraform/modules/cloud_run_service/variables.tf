variable "service_name" {
  type = string
}

variable "region" {
  type = string
}

variable "project" {
  type = string
}

variable "image" {
  type = string
}

variable "location" {
  type = string
}

variable "deletion_protection" {
  type        = bool
  default     = true
}

variable "allowed_member" {
  type        = string
}