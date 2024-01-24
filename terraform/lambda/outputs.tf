# Output the Lambda function ARN
output "lambda_function_arn" {
  value = aws_lambda_function.lambda.arn
}