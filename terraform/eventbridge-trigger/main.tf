resource "aws_cloudwatch_event_rule" "eventbridge_rule" {
  name                = var.eventbridge_rule_name
  description         = "EventBridge rule for triggering the Lambda function"
  schedule_expression = var.schedule

  event_pattern = var.event_pattern
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.eventbridge_rule.name
  target_id = "lambda_target"
  arn       = var.lambda_function_arn
}
