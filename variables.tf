variable "vpc_settings" {
  default = {
    prod = "10.10.0.0/16",
    stag = "10.20.0.0/16"
    dev  = "10.30.0.0/16"
  }
}

variable "region" {
  type    = string
  default = "eu-west-1"

  validation {
    condition     = substr(var.region, 0, 3) == "eu-"
    error_message = "Must be an EUROPE AWS Region, like \"eu-\"."
  }
}

locals {
  az_subnet_ranges = {
    1 = {
      az_name    = "a"
      cidr_block = "10.30.1.0/24"
    },
    2 = {
      az_name    = "b"
      cidr_block = "10.30.2.0/24"
    },
    3 = {
      az_name    = "c"
      cidr_block = "10.30.3.0/24"
    }
  }
}
