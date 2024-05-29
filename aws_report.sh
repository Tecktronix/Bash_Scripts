#!/bin/bash

#########################
# Name: Oluwatosin Ogunfile
# Date: 29/05/2024
#
# This script retrieves a report from AWS
#########################

# Enable debug mode
#set -x

# Enable an exit if an error is encountered
#set -e

# Enable an exit if an error is encountered before a pipe
#set -o pipefail

# List of S3 buckets
echo -e "List of S3 buckets\n"

sudo aws s3 ls

echo -e "\n"

# List of EC2 instance IDs
echo -e "List of EC2 Instances\n"

sudo aws ec2 describe-instances | jq ".Reservations.Instances[].InstanceId"

echo -e "\n"

# List of Lambda Functions
echo -e "List of Lambda Functions\n"

sudo aws lambda list-functions | jq ".Functions[].FunctionName"

echo -e "\n"

# List of IAM Users
echo -e "List of IAM Users\n"

sudo aws iam list-users | jq ".Users[].UserName"

echo -e "\n"
