variable "project_id" {
  description = "GCP project ID"
  type        = string
  default     ="absolute-hub-460713-v0"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "us-central1-a"
}

variable "ssh_user" {
  description = "SSH user for the instance"
  type        = string
  default     = "ubuntu"
}

variable "ssh_pub_key" {
  description = "Public SSH key content"
  type        = string
}