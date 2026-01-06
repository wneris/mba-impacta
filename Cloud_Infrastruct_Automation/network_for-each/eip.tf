## Create Elastic IP
resource "aws_eip" "eip-main" {
    for_each = toset(var.subnets_availability_zone)
    domain = "vpc"
    tags = {
        Name = "eip-${split("-", each.key)[2]}"
        Environment = var.environment
        Project = var.project
  }
}
