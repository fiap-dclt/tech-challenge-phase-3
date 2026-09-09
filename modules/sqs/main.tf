resource "aws_sqs_queue" "this" {
  name = "sqs-${var.env}-${var.queue_name}"

  tags = {
    Name        = "sqs-${var.env}-${var.queue_name}"
    Project     = var.project
    Environment = var.env
  }
}
