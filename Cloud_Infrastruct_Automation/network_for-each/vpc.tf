## Create VPC ##
resource "aws_vpc" "vpc-main" {
  cidr_block = "${var.vpc_cidr}"

  tags = {
    Name = var.vpc_name
    Environment = var.environment
    Project = var.project
  }
}
