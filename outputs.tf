output "vpc" {
  description = "The GCP vpc resource."
  value       = google_compute_network.this
}

output "subnet_workload" {
  description = "The GCP Subnet resources for workload."
  value       = google_compute_subnetwork.workload
}

output "subnet_bgp" {
  description = "The GCP Subnet resources for bgp."
  value       = google_compute_subnetwork.bgp
}

output "firewall" {
  description = "The GCP Firewall resource."
  value       = google_compute_firewall.this
}