resource "google_compute_firewall" "allow_postgres" {
  name    = "allow-postgres"
  network = var.network

  allow {
    protocol = "tcp"
    ports    = ["5432"]
  }

  source_ranges = var.source_ranges
  target_tags   = ["postgres"]
}
