# Restrict Firewall Ports 
# Failure condition set port of specific protocol to an invalid value
resource "google_compute_firewall" "http-ingress" {
  name    = "test-firewall"
  network = "default"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  allow {
    protocol = "udp"
    ports    = ["3000"]
  }

  source_tags = ["web"]
}
