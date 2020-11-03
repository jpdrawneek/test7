variable "domain_name" {
  type = string
}

variable "subdomain" {
  type    = string
  default = "www"
}

variable "environment" {
  type = string
  validation {
    condition     = contains(["dev", "test", "stage", "prod"], var.environment)
    error_message = "Environment vaild values are: dev, test, stage, prod."
  }
}

variable "price_class" {
  type = string
  default = "PriceClass_100"
  validation {
    condition     = contains(["PriceClass_100", "PriceClass_200", "PriceClass_All"], var.price_class)
    error_message = "Price Class value not valid, check docs."
  }
}
