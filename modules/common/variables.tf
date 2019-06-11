data "vultr_region" "new_jersey" {
  filter {
    name   = "name"
    values = ["New Jersey"]
  }
}

# $5.00/mo 25gb SSD, 1gb RAM
data "vultr_plan" "25gb" {
  filter {
    name   = "name"
    values = ["1024 MB RAM,25 GB SSD,1.00 TB BW"]
  }
}

# $10.00/mo 55gb SSD, 2gb RAM
data "vultr_plan" "55gb" {
  filter {
    name   = "name"
    values = ["2048 MB RAM,55 GB SSD,2.00 TB BW"]
  }
}

data "vultr_network" "farm" {
  filter {
    name   = "description"
    values = ["Rancher network"]
  }
}
