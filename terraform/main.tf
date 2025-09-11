terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "user-polyglot-terraform-state"   # must be globally unique in AWS
    key            = "k8s-cluster/USER-POLYGLOT/terraform.tfstate"   # state file path inside the bucket
    region         = "us-east-1"                       # adjust if needed
    dynamodb_table = "terraform-locks"                 # for state locking
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}
