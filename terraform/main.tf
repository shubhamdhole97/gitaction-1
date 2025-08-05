terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  credentials = file(var.gcp_credentials_file)
  project     = local.credentials.project_id
  region      = var.region
  zone        = var.zone
}

locals {
  credentials = jsondecode(file(var.gcp_credentials_file))
}

resource "google_compute_instance" "vm_instance" {
  name         = "small-vm"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network       = "default"
    access_config {}
  }

  metadata = {
    ssh-keys = <<EOT
ubuntu:${file(var.ssh_pub_key_path)}
EOT
  }

  tags = ["ssh"]

  lifecycle {
    create_before_destroy = true
  }
}

output "vm_ip" {
  value = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
}
