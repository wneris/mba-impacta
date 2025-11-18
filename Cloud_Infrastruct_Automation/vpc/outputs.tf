output "vpc_id" {
  value = aws_vpc.minha-vpc.id
}

output "subnet_publica_1a_id" {
  value = aws_subnet.public_subnet_1a.id
}

output "subnet_publica_1b_id" {
  value = aws_subnet.public_subnet_1b.id
}

output "subnet_publica_1c_id" {
  value = aws_subnet.public_subnet_1b.id
}

output "subnet_privada_1a_id" {
  value = aws_subnet.private_subnet_1a.id
}

output "subnet_privada_1b_id" {
  value = aws_subnet.private_subnet_1b.id
}

output "subnet_privada_1c_id" {
  value = aws_subnet.private_subnet_1c.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "public-route_id" {
  value = aws_route_table.public-rt.id
}

output "private-route-1a_id" {
  value = aws_default_route_table.private-rt-1a.id
}

output "private-route-1b_id" {
  value = aws_route_table.private-rt-1b.id
}

output "private-route-1c_id" {
  value = aws_route_table.private-rt-1c.id
}

output "elastic_ip_1a_id" {
  value = aws_eip.eip_1a.id
}
output "elastic_ip_1b_id" {
  value = aws_eip.eip_1b.id
}

output "elastic_ip_1c_id" {
  value = aws_eip.eip_1c.id
}

output "natgateway_1a_id" {
  value = aws_nat_gateway.ntg_1a.id
}

output "natgateway_1b_id" {
  value = aws_nat_gateway.ntg_1b.id
}

output "natgateway_1c_id" {
  value = aws_nat_gateway.ntg_1c.id
}
