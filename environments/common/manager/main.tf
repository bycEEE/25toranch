module "common" {
  source = "./../../../modules/common"
}


module "rancher-manager" {
  source = "./../../../modules/rancher-manager"
 
  region           = "${module.common.default_region}"
  short_name       = "ace"
  cluster_name     = "ace.25to.life"
  cloud_config_url = "http://bchoy.me/etc/cloud-config.yml"
  dns_zone         = "25to.life"

  manager_count       = 1
  manager_type        = "${module.common.55gb_plan}"
  manager_mysql_size  = 10 # 10gb block storage
  network_id          = "${module.common.farm_network_id}"
}
