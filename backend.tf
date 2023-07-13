provider "aws" {
    region = "ap-southest-2"
}

terraform {
    required_version = ">= 1.0.0, < 2.0.0"
    
    required_providers{
        aws = {
          source = "hashicorp/aws"
          version = "-> 4.0"
          }

    }
    
    backend "s3" {
        bucket = "tf-aws-lilyvo-cloud-resume-challenge-state-buclet"
        key = "terraform.tfstate"
        region: "ap-southeast-2"
        encrypt = true
    }
        
}


