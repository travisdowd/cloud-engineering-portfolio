
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "us-east-1"
}

data "aws_ssm_parameter" "amazon_linux" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_s3_bucket" "terraform_lab" {
  bucket_prefix = "travis-terraform-lab-"

  tags = {
    Name = "Terraform-Lab-S3"
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_lab" {
  bucket = aws_s3_bucket.terraform_lab.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_lab" {
  bucket = aws_s3_bucket.terraform_lab.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}