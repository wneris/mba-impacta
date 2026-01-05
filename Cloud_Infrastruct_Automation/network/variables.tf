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

