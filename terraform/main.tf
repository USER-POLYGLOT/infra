terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # backend "s3" {
  #   bucket         = "user-polyglot-terraform-state"   
  #   key            = "env/USER-POLYGLOT/terraform.tfstate"   
  #   region         = "us-east-1"                       
  #   dynamodb_table = "user-polyglot-terraform-locks"   
  #   encrypt        = true
  # }
}

provider "aws" {
  region = var.aws_region
}
