## Provider
variable "region" {
  type        = string
  description = "Região AWS"
  default     = "us-east-1" # opcional
}

variable "aws_profile" {
  type        = string
  description = "Profile do AWS CLI para uso local"
  default     = null
}

## VPC
variable "vpc_cidr" {
  type        = string
  description = "CIDR do VPC"
  default     = "192.168.0.0/16"
}

variable "vpc_name" {
  type        = string
  description = "Nome do VPC"
  default     = "main"
}

## Subnets
variable "public_subnets_cidr" {
  type        = list(string)
  description = "Publics Subnets CIDR"
  default = [ "192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24" ]
}
variable "private_subnets_region" {
  type        = list(string)
  description = "Private Subnets CIDR"
  default = [ "192.168.10.0/24", "192.168.20.0/24", "192.168.30.0/24" ]
}

variable "subnets_availability_zone" {
  type        = list(string)
  description = "Publics Subnets Availability Zone"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}


#variable "elastic_ip_domain" {
#  type        = string
#  description = "Elastic IP Domain (vpc or standard)"
#  default     = "vpc"
#}


## Tags 
variable "environment" {
  type        = string
  description = "Ambiente"
  default     = "prod"
} 
variable "project" {
  type        = string
  description = "Projeto"
  default     = "terraform"
}
