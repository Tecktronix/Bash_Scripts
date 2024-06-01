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

wrapper () {
    echo -e "$1\n"
    eval "$2"
    echo -e "\n"
}

# List of S3 buckets
wrapper "List of S3 buckets" "sudo aws s3 ls"

# List of EC2 instance IDs
wrapper "List of EC2 Instances" "sudo aws ec2 describe-instances | jq .Reservations[].Instances[].InstanceId"

# List of Lambda Functions
wrapper "List of Lambda Functions" "sudo aws lambda list-functions | jq .Functions[].FunctionName"

# List of IAM Users
wrapper "List of IAM Users" "sudo aws iam list-users | jq .Users[].UserName"