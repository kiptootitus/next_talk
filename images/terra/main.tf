terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  cloud {
    organization = "M-Connect"

    workspaces {
      name = "terraform-course"
    }
  }
}

provider "google" {
  project = "imperial-vector-459416-j4"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_instance" "terra" {
  name         = "terra-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

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
