## Create NAT Gateway
resource "aws_nat_gateway" "nat-main" {
    for_each = toset(var.subnets_availability_zone)
    allocation_id = aws_eip.eip-main[each.key].id
    subnet_id     = aws_subnet.public_subnets[var.public_subnets_cidr[index(var.subnets_availability_zone, each.key)]].id

    tags = {
        Name = "ntg-${split("-", each.key)[2]}"
        Environment = var.environment
        Project = var.project
    }
}