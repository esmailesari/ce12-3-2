# 1. Provider Configuration
provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    bucket = "sctp-ce12-tfstate-bucket"
    key    = "ee-s3buckets.tfstate"
    region = "ap-southeast-1"
  }
}

# 3. S3 Bucket Resource
resource "aws_s3_bucket" "my_bucket" {
  bucket = "ee-s3-bucket-3-2" # Ensure this is globally unique
  #checkov:skip=CKV2_AWS_62:Ensure S3 buckets should have event notifications enabled

  tags = {
    Name = "EE S3 Bucket"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.44.0"
    }
  }
}

terraform {
  required_version = ">= 1.5.0, < 2.0.0"
}