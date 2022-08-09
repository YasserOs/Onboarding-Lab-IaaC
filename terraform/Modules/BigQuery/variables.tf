variable "dataset-id"{
    type = string
}

variable "friendly-name"{
    type = string
}
variable "location"{
    type = string
}
variable "dataset-role" {
  type = string
  default = "READER"
}

variable "authorized-member" {
  type = string
  default = "allAuthenticatedUsers"
}