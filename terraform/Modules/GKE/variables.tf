variable "cluster_name" {
    type = string
  
}
variable "node-pool-name" {
  type = string
}
variable "cluster_region" {
    type = string
  
}
variable "cluster_zones" {
    type = list
  
}
variable "nodes-count" {
    type = number
}

variable "node-type" {
  type = string
}
variable "os-image" {
  type = string
}
variable "disk-type" {
  type = string
}
variable "disk-size" {
    type = number
}
variable "authorized-cidr-range" {
    type = string
  
}
variable "project" {
  type = string
}
variable "sa" {
    type = string
  
}

variable "vpc-selflink"{
  type = string
}

variable "subnet-selflink" {
  type = string
}