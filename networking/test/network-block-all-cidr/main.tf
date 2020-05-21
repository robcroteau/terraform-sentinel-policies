// Testing Source Ranges for firewalls to disallow open CIDR blocks
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

  source_ranges = ["10.20.30.40/24"]
}

// Uncomment to fail
/*
resource "google_compute_firewall" "fail-firewall" {
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

  source_ranges = ["10.20.30.40/24","0.0.0.0/0"]
}
*/