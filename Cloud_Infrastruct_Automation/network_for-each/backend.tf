terraform {
  backend "s3" {
    bucket         = var.bucket_s3
    key            = "tfstate/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
