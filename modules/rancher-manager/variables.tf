variable "short_name" {
  type        = "string"
  description = "Unique cluster name without the domain"
}

variable "cluster_name" {
  type        = "string"
  description = "Unique cluster name with the domain"
}

variable "cloud_config_url" {
  type        = "string"
  description = "URL to retrieve the cloud-config from"
}

variable "rancher_version" {
  type        = "string"
  description = "Rancher version"
  default     = "latest"
}

# Vultr

variable "region" {
  type        = "string"
  description = "Vultr region ID (e.g. 1, see `curl https://api.vultr.com/v1/regions/list`)"
}

variable "dns_zone" {
  type        = "string"
  description = "Vultr DNS Zone (e.g. vultr.example.com)"
}

variable "network_id" {
  type        = "string"
  description = "Cluster network ID"
}

# instances

variable "manager_count" {
  type        = "string"
  default     = "1"
  description = "Number of managers (Rancher Server)"
}

variable "manager_type" {
  type        = "string"
  description = "Vultr plan ID for managers"
}

variable "manager_mysql_size" {
  type        = "string"
  description = "MySQL block storage size for Rancher Server"
}
