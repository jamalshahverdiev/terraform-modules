variable "vpc_id" {
  default = "id-sdfsfsdfsdfsdfsd"
}
variable "cidr_block" {
  default = "10.10.30.0/24"
}

variable "subnet_definition" {
  type    = bool
  default = false
}

variable "az_name" {
  default = "us-east-1a"
}

variable "subnet_description" {
  type    = string
  default = "private"
}

variable "private_subnet_id" {
  default = "private-subnet"
}
