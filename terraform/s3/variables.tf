variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "eu-west-2"
}

variable "deploy_s3_event_trigger" {
  description = "Switch to determine whether the S3 event trigger is deployed"
  default     = false
  type        = bool
}

variable "lambda_function_arn" {
  type        = string
  description = "ARN of the Lambda function"
  default     = ""
}

variable "s3_notification_events" {
  description = "List of the S3 events that will trigger the Lambda function"
  default     = ""
}

variable "filter_prefix" {
  type        = string
  description = "Used to filter events based on the object prefix"
  default     = ""
}

variable "filter_suffix" {
  type        = string
  description = "Used to filter events based on the object suffix"
  default     = ""
}