#!/bin/bash
if echo "$AWS_DEFAULT_REGION" | grep -q "$AWS_DEFAULT_REGION"; then
  echo "Adding default region key"
  echo "aws_default_region = $AWS_DEAFULT_REGION" >> terraform.tfvars
else
  echo "No region was set."
fi

if echo "$AWS_ACCOUNT_ID" | grep -q "$AWS_ACCOUNT_ID"; then
  echo "Adding AWS account ID"
  echo "aws_account_id = $AWS_ACCOUNT_ID" >> terraform.tfvars
else
  echo "No account ID was set."
fi

if echo "$AWS_SECRET_ACCESS_KEY" | grep -q "$AWS_SECRET_ACCESS_KEY"; then
  echo "Adding secret account key"
  echo "aws_account_key = $AWS_SECRET_ACCESS_KEY" >> terraform.tfvars
else
  echo "No secret key was set."
fi
