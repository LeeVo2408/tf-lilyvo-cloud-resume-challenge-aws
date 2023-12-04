provider "aws" {
  region = "ap-southeast-2"

 default_tags {
   tags = {
     Environment = "nonprod"
     Managed_by       = "https://github.com/LeeVo2408/tf-lilyvo-cloud-resume-challenge-aws"
     Project     = "Cloud Resume Challenge"
   }
 }
}

terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

  }

  backend "s3" {
    bucket  = "tf-aws-lilyvo-cloud-resume-challenge-state-bucket"
    key     = "terraform.tfstate"
    region  = "ap-southeast-2"
    encrypt = true
    dynamodb_table = "terraform-state-lock"
  }

}








