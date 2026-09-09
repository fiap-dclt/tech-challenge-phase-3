resource "aws_secretsmanager_secret" "this" {
  name                    = "secret-${var.env}-${var.secret_name}"
  recovery_window_in_days = 0
  tags = {
    Environment = var.env,
    Project     = var.project
  }
}

resource "aws_secretsmanager_secret_version" "this_version" {
  secret_id     = aws_secretsmanager_secret.this.id
  secret_string = var.secret_value
}
