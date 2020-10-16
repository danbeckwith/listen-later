terraform {
  backend "s3" {
    bucket = "listen-later-terraform"
    key = "default/tf/terraform.tfstate"
    region = "eu-west-1" 
  }
}