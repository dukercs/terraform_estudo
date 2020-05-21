provider "aws" {
  region  = "us-east-1"
  version = "~> 2.0"
}

terraform {
  backend "s3" {
    bucket = "iaasweek-costach"
    key    = "terraformt.tfstate"
    region = "us-east-1"
  }
}