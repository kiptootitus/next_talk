resource "google_compute_disk" "postgres_disk" {
  name  = var.disk_name
  type  = var.disk_type
  zone  = var.zone
  size  = var.disk_size_gb
}
