variable "inbound-ports" {
  type    = list(string)
  default = [ "22", "80", "143", "465", "587", "993" ]
}

variable "domain-name" {
  type    = string
}

variable "subdomain" {
  type    = string
  default = "test"
}
