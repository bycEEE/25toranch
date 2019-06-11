data "vultr_os" "custom" {
  filter {
    name   = "family"
    values = ["iso"]
  }
}

data "template_file" "ipxe" {
  template = "${file("${path.module}/templates/ipxe.tmpl")}"

  vars {
    base-url = "https://releases.rancher.com/os/${var.rancher_version}"
    cloud-config-url = "${var.cloud_config_url}"
  }
}

resource "vultr_instance" "manager" {
  count              = "${var.manager_count}"
  name               = "manager-${format("%02d", count.index + 1)}.${var.cluster_name}"
  hostname           = "manager-${format("%02d", count.index + 1)}.${var.cluster_name}"
  region_id          = "${var.region}"
  plan_id            = "${var.manager_type}"
  os_id              = "${data.vultr_os.custom.id}"
  startup_script_id  = "${vultr_startup_script.ipxe.id}"
  tag                = "manager-${format("%02d", count.index + 1)}.${var.cluster_name}"
  firewall_group_id  = "${vultr_firewall_group.cluster.id}"
  private_networking = true
  network_ids        = ["${var.network_id}"]
  ipv6               = true
}

resource "vultr_block_storage" "manager" {
  count     = "${var.manager_count}"
  name      = "manager-${format("%02d", count.index + 1)}.${var.cluster_name}"
  region_id = "${var.region}"
  size      = "${var.manager_mysql_size}"
  instance  = "${vultr_instance.manager.0.id}"
}

resource "vultr_startup_script" "ipxe" {
  type    = "pxe"
  name    = "${var.cluster_name}"
  content = "${data.template_file.ipxe.rendered}"
}
