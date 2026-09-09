# Bucket S3 to store the state of Terraform
resource "aws_s3_bucket" "state" {
  bucket        = "toggle-master-automated"
  force_destroy = true
  tags = {
    Project = "FIAP Tech Challenge Phase 3"
  }
}

resource "aws_s3_bucket_versioning" "state" {
  bucket = aws_s3_bucket.state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "state" {
  bucket = aws_s3_bucket.state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}