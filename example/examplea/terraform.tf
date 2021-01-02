terraform {
  required_providers {
    aws = {
      version = "3.22.0"
      source  = "hashicorp/aws"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.0"
    }
  }
}
