resource "vultr_dns_record" "manager_instances" {
  count    = "${var.manager_count}"
  domain   = "${var.dns_zone}"
  name     = "manager-${format("%02d", count.index + 1)}.${var.short_name}"
  type     = "A"
  data     = "${lookup(vultr_instance.manager.*.networks[count.index], var.network_id)}"
  ttl      = 120
}

# static name pointing to the first manager since there's only one for now
resource "vultr_dns_record" "manager" {
  domain   = "${var.dns_zone}"
  name     = "${var.short_name}"
  type     = "A"
  data     = "${vultr_instance.manager.0.ipv4_address}"
  ttl      = 120
}
