variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "ipsec_network_test"
}

#variable "zone" {
#  type    = string
#  default = "ru-central1-a"
#}

variable "net_cidr" {
  description = "Subnet structure primitive"
  type = list(object({
    name   = string,
    zone   = string,
    prefix = string
  }))

  default = [
    { name = "remote-subnet-a", zone = "ru-central1-a", prefix = "10.70.1.0/24" },
    { name = "remote-subnet-b", zone = "ru-central1-b", prefix = "10.71.1.0/24" },
    { name = "remote-subnet-c", zone = "ru-central1-c", prefix = "10.72.1.0/24" },
  ]

  validation {
    condition     = length(var.net_cidr) >= 1
    error_message = "At least one Subnet/Zone should be used."
  }
}