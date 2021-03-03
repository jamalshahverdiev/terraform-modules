module "vpc-dev" {
  source   = "./modules/aws/network/vpc"
  env      = "dev"
  vpc_cidr = var.vpc_settings["dev"]
}

module "subnets" {
  for_each           = local.az_subnet_ranges
  source             = "./modules/aws/network/subnets"
  vpc_id             = module.vpc-dev.vpc_id
  cidr_block         = each.value["cidr_block"]
  subnet_definition  = false
  az_name            = join("", [var.region, each.value["az_name"]])
  subnet_description = "private"
  private_subnet_id  = each.key
  depends_on         = [module.vpc-dev]
}

# module "vpc" {
#   count  = 2 # <--Supported only in Terraform 0.13+
#   source = "./modules/aws_network"
#   env    = "demo-${count.index + 1}"
# }

# module "vpc_list" {
#   for_each = var.vpc_settings # <--Supported only in Terraform 0.13+
#   source   = "./modules/aws_network"
#   env      = each.key
#   vpc_cidr = each.value
# }


