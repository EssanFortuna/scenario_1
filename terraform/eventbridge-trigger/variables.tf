variable "lambda_function_name" {
  description = "Name of the Lambda function"
}

variable "lambda_function_arn" {
  description = "ARN of the Lambda function"
}

variable "eventbridge_rule_name" {
  description = "Name of the EventBridge rule"
}

variable "schedule" {
  description = "Schedule of the EventBridge rule"
}

variable "event_pattern" {
  description = "Event pattern of the EventBridge rule"
}