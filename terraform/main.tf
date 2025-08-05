resource "google_compute_instance" "ubuntu_vm" {
  name         = "ubuntu-instance"
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

  tags = ["ssh"]

  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_pub_key}"
  }
}

output "vm_ip" {
  value = google_compute_instance.ubuntu_vm.network_interface[0].access_config[0].nat_ip
}