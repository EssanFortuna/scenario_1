terraform {
  backend "s3" {
    bucket  = "scenario-1-tfstate-s3"
    key     = "scenario-1.tfstate"
    region  = "eu-west-2"
    encrypt = true
  }
}

# Deployment of the "weather_retrieve" S3 Bucket with event trigger for the ETL Lambda
module "s3_weather_retrieve" {
  source                  = "./s3"
  deploy_s3_event_trigger = true
  lambda_function_arn     = module.lambda_weather_etl.lambda_function_arn
  bucket_name             = "weather_landing"
  s3_notification_events  = "s3:ObjectCreated:*"
}

# Deployment of the "weather_retrieve" Lambda
module "lambda_weather_retrieve" {
  source                       = "./lambda"
  lambda_execution_role_name   = var.weather_retrieve_execution_role_name
  lambda_execution_policy_name = var.weather_retrieve_execution_policy_name
  lambda_function_name         = var.weather_retrieve_lambda_function_name
  bucket_name                  = var.weather_landing_bucket_name
  payload_output_path          = "lambda_function_payload.zip"
  payload_source_dir           = "lambda_function_code"
}

# Deployment of the "weather_etl" S3 Bucket
module "s3_weather_etl" {
  source      = "./s3"
  bucket_name = "weather_etl"
}

# Deployment of the "weather_etl" Lambda
module "lambda_weather_etl" {
  source                       = "./lambda"
  lambda_execution_role_name   = var.weather_etl_execution_role_name
  lambda_execution_policy_name = var.weather_etl_execution_policy_name
  lambda_function_name         = var.weather_etl_lambda_function_name
  bucket_name                  = var.weather_transformed_bucket_name
  payload_output_path          = "lambda_function_payload.zip"
  payload_source_dir           = "lambda_function_code"
}

# Deployment of the Eventbridge with Mon - Fri 5am trigger
module "eventbridge-trigger" {
  source                = "./eventbridge-trigger"
  eventbridge_rule_name = "mon-fri-5am"
  lambda_function_name  = var.weather_retrieve_lambda_function_name
  lambda_function_arn   = module.lambda_weather_retrieve.lambda_function_arn
  schedule              = "cron(0 5 * * 1-5)"
  event_pattern         = <<PATTERN
{
  "source": ["aws.events"],
  "detail-type": ["Scheduled Event"],
  "resources": ["${var.weather_retrieve_lambda_function_name}"]
}
PATTERN
}