output "default_region" {
  value = "${data.vultr_region.new_jersey.id}"
}

output "25gb_plan" {
  value = "${data.vultr_plan.25gb.id}"
}

output "55gb_plan" {
  value = "${data.vultr_plan.55gb.id}"
}

output "farm_network_id" {
  value = "${data.vultr_network.farm.id}"
}

output "default_network_ids" {
  value = ["${data.vultr_network.farm.id}"]
}