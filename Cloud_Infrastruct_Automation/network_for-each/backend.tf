terraform {
  backend "s3" {
    bucket         = "339713145552-tfstate"
    key            = "tfstate/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
