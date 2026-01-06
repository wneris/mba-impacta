output "vpc_id" {
  value = aws_vpc.vpc-main.id
}

output "public_subnet_ids" {
  value = [for subnet in aws_subnet.public_subnets : subnet.cidr_block]
}

output "private_subnet_ids" {
  value = [for subnet in aws_subnet.private_subnets : subnet.cidr_block]
}
output "igw_id" {
  value = aws_internet_gateway.igw-main.id
}
output "public_rt_id" {
  value = aws_route_table.public-rt.id
}

output "eip_public_ip" {
  value = [for eip in aws_eip.eip-main : eip.public_ip]
}

output "ntg_id" {
  value = [for ntg in aws_nat_gateway.nat-main : ntg.id]
}