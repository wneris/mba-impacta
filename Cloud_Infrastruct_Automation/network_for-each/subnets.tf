## Create public subnets (for_each)
resource "aws_subnet" "public_subnets" {
  for_each = toset(var.public_subnets_cidr)
  vpc_id            = aws_vpc.vpc-main.id
  cidr_block        = each.key
  #availability_zone = each.key
  availability_zone = var.subnets_availability_zone[index(var.public_subnets_cidr, each.key)]
  tags = {
    Name = "public-subnet-${split("-", var.subnets_availability_zone[index(var.public_subnets_cidr, each.key)])[2]}"
    Environment = var.environment
    Project = var.project
  }
}

## Create Private Subnets (for_each)
resource "aws_subnet" "private_subnets" {
  for_each = toset(var.private_subnets_region)
  vpc_id            = aws_vpc.vpc-main.id
  cidr_block        = each.key
  availability_zone = var.subnets_availability_zone[index(var.private_subnets_region, each.key)]
  tags = {
    Name = "private-subnet-${split("-", var.subnets_availability_zone[index(var.private_subnets_region, each.key)])[2]}"
    Environment = var.environment
    Project = var.project
  }
}