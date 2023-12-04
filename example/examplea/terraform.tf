terraform {
  required_providers {
    aws = {
      version = "5.13.1"
      source  = "hashicorp/aws"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
  required_version = ">= 1.3.5"
}
