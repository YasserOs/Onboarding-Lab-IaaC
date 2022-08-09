////////// GENERAL /////////
variable "project_" {
  type = string
}

variable "region" {
  type = string
}



////// BUCKET INFO ///////////
variable "bucket_name" {
  type = string 
}
variable "location" {
  type = string

}
variable "storage_class" {
  type = string 
}
variable "bucket_access_role" {
  type = string
}

////// Network info ///////
variable "VPC_name" {
  type = string
}

variable "Subnet_name" {
  type = string
}

variable "Subnet_cidr" {
  type = string
}

variable "router-name" {
  type = string
}

variable "firewall-rule-name" {
  type = string
}

variable "firewall-rule-protocol" {
  type = string
}

variable "firewall-rule-ports" {
  type = list
}

variable "source_ranges" {
  type = list
}

////////////////// Service Account 1 test vm /////////
variable "sa-id" {
  type = string
}

variable "sa-display-name" {
  type = string
}

variable "role" {
  type = string
}


////////////////// Service Account 2 container registry /////////
variable "sa-id-2" {
  type = string
}

variable "sa-display-name-2" {
  type = string
}

variable "role2" {
  type = string
}


//////////////// test Virtual machine /////////

variable "Machine_name" {
  type = string
}

variable "Machine_type" {
  type = string
}

variable "Zone" {
  type = string
}

variable "OS_image" {
  type = string
}

/////////////// BigQuery //////
variable "dataset-id" {
  type = string
}

variable "friendly-name" {
  type = string
}

variable "bq_location" {
  type = string
}
variable "dataset-access-role" {
  type = string
}


/////////// GKE //////////////
variable "cluster_name" {
  type = string
}

variable "node_pool_name" {
  type = string
}

variable "cluster_zones" {
  type = list
}

variable "cluster_region" {
  type = string
}

variable "nodes_per_zone" {
  type = number
}

variable "node_type" {
  type = string
}

variable "gke_disk_type" {
  type = string
}

variable "gke_disk_size" {
  type = number
}

variable "gke_os_image" {
  type = string
}
