# DynamoDB Table to store the state lock of Terraform
resource "aws_dynamodb_table" "locks" {
  name         = "toggle-master-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Project = "FIAP Tech Challenge Phase 3"
  }
}
