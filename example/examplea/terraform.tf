terraform {
  required_providers {
    aws = {
      version = "3.55.0"
      source  = "hashicorp/aws"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
  required_version = ">=0.14.8"
}
