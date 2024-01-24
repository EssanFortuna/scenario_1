#!/usr/bin/env bash

set -e
set -v

S3_NAME=scenario-1-tfstate-s3
REGION=eu-west-2

aws s3 mb s3://$S3_NAME --region $REGION

aws s3api put-public-access-block --bucket $S3_NAME --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true" --region $REGION

aws s3api put-bucket-versioning --bucket $S3_NAME --versioning-configuration "Status=Enabled" --region $REGION