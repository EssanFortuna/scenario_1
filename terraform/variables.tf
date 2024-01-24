variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "eu-west-2"
}

# Lambda - weather_retrieve 
variable "weather_retrieve_execution_role_name" {
  type        = string
  description = "Name of the IAM role for Lambda execution (weather_retrieve)"
}

variable "weather_retrieve_execution_policy_name" {
  type        = string
  description = "Name of the IAM policy for Lambda execution role (weather_retrieve)"
}

variable "weather_retrieve_lambda_function_name" {
  type        = string
  description = "Name of the Lambda function (weather_retrieve)"
}

variable "weather_landing_bucket_name" {
  type        = string
  description = "The name of the S3 bucket (weather_landing)"
}

# Lambda - weather_etl
variable "weather_etl_execution_role_name" {
  type        = string
  description = "Name of the IAM role for Lambda execution (weather_etl)"
}

variable "weather_etl_execution_policy_name" {
  type        = string
  description = "Name of the IAM policy for Lambda execution role (weather_etl)"
}

variable "weather_etl_lambda_function_name" {
  type        = string
  description = "Name of the Lambda function (weather_etl)"
}

variable "weather_transformed_bucket_name" {
  type        = string
  description = "The name of the S3 bucket (weather_transformed)"
}
