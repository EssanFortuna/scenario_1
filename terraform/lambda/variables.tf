variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "eu-west-2"
}

variable "lambda_function_name" {
  type        = string
  description = "Name of the Lambda function"
}

variable "lambda_handler" {
  type        = string
  description = "Lambda function handler"
  default     = "index.handler"
}

variable "lambda_runtime" {
  type        = string
  description = "Lambda function runtime"
  default     = "python3.8"
}

variable "lambda_memory_size" {
  type        = number
  description = "Lambda function memory size in MB"
  default     = 128
}

variable "lambda_timeout" {
  type        = number
  description = "Lambda function timeout in seconds"
  default     = 10
}

variable "lambda_environment_variables" {
  type        = map
  description = "Environment variables for the Lambda function"
  default     = {}
}

variable "lambda_execution_role_name" {
  type        = string
  description = "Name of the IAM role for Lambda execution"
}

variable "lambda_execution_policy_name" {
  type        = string
  description = "Name of the IAM policy for Lambda execution role"
}

variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket"
  default     = ""
}

variable "payload_output_path" {
  type        = string
  description = "Filepath to the outputted lambda zip file"
}

variable "payload_source_dir" {
  type        = string
  description = "Filepath to the lambda code file"
}