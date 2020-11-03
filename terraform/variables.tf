variable "domain_name" {
  type = string
}

variable "subdomain" {
  type    = string
  default = "www"
}

variable "environment" {
  type = string
}

variable "price_class" {
  type = string
  default = "PriceClass_100"
}
