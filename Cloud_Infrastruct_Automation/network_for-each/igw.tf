resource "aws_internet_gateway" "igw-main" {
  vpc_id = aws_vpc.vpc-main.id

  tags = {
    Name = "igw-main"
    Environment = var.environment
    Project = var.project
  }
}