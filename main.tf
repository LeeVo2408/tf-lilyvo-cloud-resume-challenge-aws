#tfsec:ignore:aws-s3-enable-versioning
#tfsec:ignore:aws-s3-encryption-customer-key 
resource "aws_s3_bucket" "cloud_resume_site_bucket" {
  bucket = "tf-aws-lilyvo-cloud-resume-challenge"

  logging {
    target_bucket = aws_s3_bucket.cloud_resume_logging_bucket.id
  }

  server_side_encryption_configuration {
    rule {
      bucket_key_enable = true

      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "cloud_resume_site_bucket" {
  bucket                  = aws_s3_bucket.cloud_resume_site_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#tfsec:ignore:aws-s3-enable-bucket-logging
#tfsec:ignore:aws-s3-encryption-customer-key 
resource "aws_s3_bucket" "cloud_resume_logging_bucket" {
  bucket = "tf-aws-lilyvo-cloud-resume-challenge"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      bucket_key_enabled = true

      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "cloud_resume_logging_bucket" {
  bucket                  = aws_s3_bucket.cloud_resume_logging_bucket
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
