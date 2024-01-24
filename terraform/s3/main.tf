resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_name
  }
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "private"

  depends_on = [
    aws_s3_bucket.s3_bucket
  ]
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  count  = var.deploy_s3_event_trigger ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.id

  lambda_function {
    lambda_function_arn = var.lambda_function_arn
    events              = [var.s3_notification_events]
    filter_prefix       = var.filter_prefix
    filter_suffix       = var.filter_suffix
  }
}