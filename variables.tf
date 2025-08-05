variable "gcp_credentials_file" {}
variable "region" {
  default = "us-central1"
}
variable "zone" {
  default = "us-central1-a"
}
variable "ssh_user" {
  default = "ubuntu"
}
variable "ssh_pub_key_path" {
  default = "~/.ssh/id_rsa.pub"
}
