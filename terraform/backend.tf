terraform {
  backend "s3" {
    bucket       = "hemosz"
    key          = "nonprod/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
  }
}
