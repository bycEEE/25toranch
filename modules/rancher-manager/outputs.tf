output "firewall_group_id" {
  value       = "${vultr_firewall_group.cluster.id}"
  description = "Firewall group ID of the cluster"
}
