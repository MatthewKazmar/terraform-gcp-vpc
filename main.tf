data "http" "myip" {
  url = "http://ifconfig.me"
}

resource "google_compute_network" "this" {
  name = var.name
}

resource "google_compute_subnetwork" "workload" {
  for_each = var.region_supernet_map

  name          = "${var.name}-${each.key}-workload"
  ip_cidr_range = cidrsubnet(each.value, 3, 0)
  region        = each.key
  network       = google_compute_network.this.id
}

resource "google_compute_subnetwork" "bgp" {
  for_each = var.region_supernet_map

  name          = "${var.name}-${each.key}-bgp"
  ip_cidr_range = cidrsubnet(each.value, 3, 1)
  region        = each.key
  network       = google_compute_network.this.id
}

resource "google_compute_firewall" "this" {
  name    = "${var.name}-admin-rule"
  network = google_compute_network.this.name

  allow {
    protocol = "all"
  }

  source_ranges = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16", "35.235.240.0/20", "${data.http.myip.response_body}/32"]
}