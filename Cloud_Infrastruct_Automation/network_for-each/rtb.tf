## Create Public Route Table
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc-main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-main.id
  }

  tags = {
    Name = "rtb-main"
    Environment = var.environment
    Project = var.project
  }
}

## Associate Public Route Table with Public Subnets
resource "aws_route_table_association" "public-rt-association" {
  for_each       = aws_subnet.public_subnets
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public-rt.id
}

## Create Private Route Table
resource "aws_route_table" "private-rt" {
  for_each = toset(var.subnets_availability_zone)
  vpc_id = aws_vpc.vpc-main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-main[each.key].id
  }
  tags = {
    Name = "rtb-private-${split("-", each.key)[2]}"
    Environment = var.environment
    Project = var.project
  }
}

## Associate Private Route Table with Private Subnets
resource "aws_route_table_association" "private-rt-association" {
  for_each       = aws_subnet.private_subnets
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private-rt[each.value.availability_zone].id
}