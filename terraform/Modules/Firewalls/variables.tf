variable "firewall-rule-name"{
    type        = string
}
variable "firewall-rule-protocol" {
    type        = string
}
variable "firewall-rule-ports" {
    type        = list
}
variable "source_ranges" {
    type = list
    
}
variable "network_id" {
  type = string
}