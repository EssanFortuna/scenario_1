#!/usr/bin/env bash

set -e
set -v

S3_NAME=scenario-1-tfstate-s3
REGION=eu-west-2

aws s3api delete-bucket --bucket $S3_NAME --region $REGION