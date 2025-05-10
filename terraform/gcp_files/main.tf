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


module "gcp_instance" {
  source = "./modules/gcp_instance"
  zone   = var.zone
}

module "gcp_volume" {
  source        = "./modules/gcp_volume"
  zone          = var.zone
  disk_name     = var.disk_name
  disk_size_gb  = 50
  disk_type     = "pd-ssd"
}

module "security_group" {
  source        = "./modules/security_group"
  network       = "default"
  source_ranges = ["0.0.0.0/0"]
}

output "instance_ip" {
  value = module.gcp_instance.instance_ip
}
