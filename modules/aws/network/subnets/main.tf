
resource "aws_subnet" "general_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block
  map_public_ip_on_launch = var.subnet_definition
  availability_zone       = var.az_name

  tags = {
    Name = "${var.subnet_description}-subnet-${var.private_subnet_id}"
  }
}
