resource "google_compute_instance" "terra" {
  name         = var.instance_name
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"

    access_config {
      # Ephemeral public IP
    }
  }

  tags = ["http-server", "https-server"]
}

output "instance_ip" {
  value = google_compute_instance.terra.network_interface[0].access_config[0].nat_ip
}
