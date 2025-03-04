variable "project_id" {
  type        = string
  description = "Project Identifier"
  default     = "coral-subject-305912"
}

variable "project_region" {
  type        = string
  description = "Project Region"
  default     = "us-west2" # Los Angeles, CA, USA
}

variable "project_prefix" {
  type        = string
  description = "Project Prefix"
  default     = "gke-demo"
}

variable "node_pools_oauth_scopes" {
  type        = list
  description = "oAuth Scopes for Node Pools"
  default = [
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
    "https://www.googleapis.com/auth/servicecontrol",
    "https://www.googleapis.com/auth/service.management.readonly",
    "https://www.googleapis.com/auth/trace.append",
  ]
}

locals {
  subnet_name = "${var.project_prefix}-subnet"
}

# get your public IP address by querying ICHI
data "http" "icanhazip" {
  # this value will be available in data.http.icanhazip.body
  url = "https://icanhazip.com/"
}
