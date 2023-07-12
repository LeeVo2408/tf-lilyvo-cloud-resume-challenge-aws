provider "aws" {
    region = "ap-southest-2"

    assume_role{
        role_arn: "arn:aws:iam::252874068638:role/GitHubAction-AssumeRoleWithAction"
        session_name: "tf-lilyvo-cloud resume-challenge"
        external_id: "LeeVo2408@github"
    }
    # }
    # # default_tags{
    # #     # tags: 
    # }
}
terraform {
    required_version = ">= 1.0.0, < 2.0.0"
    
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = " -> 4.8"
        }

    }
    
    backend "s3" {
        bucket = ""
        key = "terraform.tfstate"
        region: "ap-southeast-2"
        encrypt = true
        #dynamodb_table = "terraform-locks"
        #role_arn = "arn:aws:iam::252874068638:role/GitHubAction-AssumeRoleWithAction"
    
    }
        
}


