resource "vultr_firewall_group" "cluster" {
  description = "${var.cluster_name}"
}

resource "vultr_firewall_rule" "api" {
  firewall_group_id = "${vultr_firewall_group.cluster.id}"
  cidr_block        = "0.0.0.0/0"
  protocol          = "tcp"
  from_port         = 6443
  to_port           = 6443
}

resource "vultr_firewall_rule" "ssh" {
  firewall_group_id = "${vultr_firewall_group.cluster.id}"
  cidr_block        = "0.0.0.0/0"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
}

resource "vultr_firewall_rule" "https" {
  firewall_group_id = "${vultr_firewall_group.cluster.id}"
  cidr_block        = "0.0.0.0/0"
  protocol          = "tcp"
  from_port         = 443
  to_port           = 443
}

resource "vultr_firewall_rule" "rancher_manager" {
  firewall_group_id = "${vultr_firewall_group.cluster.id}"
  cidr_block        = "0.0.0.0/0"
  protocol          = "tcp"
  from_port         = 8080
  to_port           = 8080
}

resource "vultr_firewall_rule" "http" {
  firewall_group_id = "${vultr_firewall_group.cluster.id}"
  cidr_block        = "0.0.0.0/0"
  protocol          = "tcp"
  from_port         = 80
  to_port           = 80
}

# Add a firewall rule to the group allowing ICMP.
resource "vultr_firewall_rule" "icmp" {
  firewall_group_id = "${vultr_firewall_group.cluster.id}"
  cidr_block        = "0.0.0.0/0"
  protocol          = "icmp"
}
