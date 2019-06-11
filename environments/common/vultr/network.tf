module "common" {
  source = "./../../../modules/common"
}

resource "vultr_network" "farm" {
  description = "Rancher network"
  region_id   = "${module.common.default_region}"
}
