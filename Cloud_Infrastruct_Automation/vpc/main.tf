## Create VPC
resource "aws_vpc" "minha-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-terraform"
  }
}


## Create Public Subnet - AZ A
resource "aws_subnet" "public_subnet_1a" {
  vpc_id            = aws_vpc.minha-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "public_subnet_1a"
  }
}

## Create Private Subnet - AZ A
resource "aws_subnet" "private_subnet_1a" {
  vpc_id            = aws_vpc.minha-vpc.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private_subnet_1a"
  }
}


## Create Public Subnet - AZ B
resource "aws_subnet" "public_subnet_1b" {
  vpc_id            = aws_vpc.minha-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "public_subnet_1b"
  }
}

## Create Private Subnet - AZ B
resource "aws_subnet" "private_subnet_1b" {
  vpc_id            = aws_vpc.minha-vpc.id
  cidr_block        = "10.0.20.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "private_subnet_1b"
  }
}

## Create Public Subnet - AZ C
resource "aws_subnet" "public_subnet_1c" {
  vpc_id            = aws_vpc.minha-vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "public_subnet_1c"
  }
}

## Create Private Subnet - AZ C
resource "aws_subnet" "private_subnet_1c" {
  vpc_id            = aws_vpc.minha-vpc.id
  cidr_block        = "10.0.30.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "private_subnet_1c"
  }
}


## Create Internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.minha-vpc.id

  tags = {
    Name = "igw-vpc-terraform"
  }
}

## Create public route table

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.minha-vpc.id

  # since this is exactly the route AWS will create, the route will be adopted
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-rt-terraform"
  }
}

## Associate public route table to public subnet 1a
resource "aws_route_table_association" "public_rt_a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public-rt.id
}

## Associate public route table to public subnet 1b
resource "aws_route_table_association" "public_rt_b" {
  subnet_id      = aws_subnet.public_subnet_1b.id
  route_table_id = aws_route_table.public-rt.id
}

## Associate public route table to public subnet 1c
resource "aws_route_table_association" "public_rt_c" {
  subnet_id      = aws_subnet.public_subnet_1c.id
  route_table_id = aws_route_table.public-rt.id
}



## Create route public table 1a (modify default toute table)
resource "aws_default_route_table" "private-rt-1a" {
  default_route_table_id = aws_vpc.minha-vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ntg_1a.id

  }

  tags = {
    Name = "private-rt-1a-terraform"
  }
}

## Create route table 1b
resource "aws_route_table" "private-rt-1b" {
  vpc_id = aws_vpc.minha-vpc.id

  #since this is exactly the route AWS will create, the route will be adopted
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ntg_1b.id
  }
  tags = {
    Name = "private-rt-1b-terraform"
  }
}

## Create route table 1c
resource "aws_route_table" "private-rt-1c" {
  vpc_id = aws_vpc.minha-vpc.id

  #since this is exactly the route AWS will create, the route will be adopted
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ntg_1c.id
  }
  tags = {
    Name = "private-rt-1c-terraform"
  }
}


## Associate private route table to private subnet 1a
resource "aws_route_table_association" "private_rt-1a" {
  subnet_id      = aws_subnet.private_subnet_1a.id
  route_table_id = aws_default_route_table.private-rt-1a.id
}

## Associate private route table to private subnet 1b
resource "aws_route_table_association" "private_rt-1b" {
  subnet_id      = aws_subnet.private_subnet_1b.id
  route_table_id = aws_route_table.private-rt-1b.id
}

## Associate private route table to private subnet 1c
resource "aws_route_table_association" "private_rt-1c" {
  subnet_id      = aws_subnet.private_subnet_1c.id
  route_table_id = aws_route_table.private-rt-1c.id
}



## Create Elastic IP 1a
resource "aws_eip" "eip_1a" {
  domain = "vpc"
  tags = {
    Name = "eip-1a-terraform"
  }
}

## Create Elastic IP 1b
resource "aws_eip" "eip_1b" {
  domain = "vpc"
  tags = {
    Name = "eip-1b-terraform"
  }
}

## Create Elastic IP 1c
resource "aws_eip" "eip_1c" {
  domain = "vpc"
  tags = {
    Name = "eip-1c-terraform"
  }
}



## Create natgateway 1a
resource "aws_nat_gateway" "ntg_1a" {
  allocation_id = aws_eip.eip_1a.id
  subnet_id     = aws_subnet.private_subnet_1a.id

  tags = {
    Name = "nat-gateway-1a"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

## Create natgateway 1b
resource "aws_nat_gateway" "ntg_1b" {
  allocation_id = aws_eip.eip_1b.id
  subnet_id     = aws_subnet.private_subnet_1b.id

  tags = {
    Name = "nat-gateway-1b"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

## Create natgateway 1c
resource "aws_nat_gateway" "ntg_1c" {
  allocation_id = aws_eip.eip_1c.id
  subnet_id     = aws_subnet.private_subnet_1c.id

  tags = {
    Name = "nat-gateway-1c"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}


