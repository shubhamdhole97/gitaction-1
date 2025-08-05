variable "ssh_user" {}
variable "ssh_pub_key" {}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project     = "crypto-lodge-466511-s8"
  region      = "us-central1"
  zone        = "us-central1-a"
}

resource "google_compute_instance" "vm_instance" {
  name         = "small-vm"
  machine_type = "e2-small"
  zone         = "us-central1-a"

  lifecycle {
    create_before_destroy = true
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_pub_key}"
  }

  tags = ["http-server", "https-server", "ssh"]
}


output "vm_ip" {
  value = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
}
