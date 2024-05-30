#!/bin/bash

#####################
# Name: Oluwatosin Ogunfile
# Date: 30/05/2024
#
# This script lists the users of a github repo
#
# Argument: Frist argument is the repo owner,
# 	    Sencond argument is the repo name.
#
# Enviromental Variables: 1. "username" is the repo username
#			  2. "token" is the github token
#
#####################

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
USERNAME=$username
TOKEN=$token

# User and Repository information
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repository
function list_users_with_read_access {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # Fetch the list of collaborators on the repository
    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

    # Display the list of collaborators with read access
    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
    fi
}

# Main script

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."

function main {
if [[ $# -ne 2 ]] ; then
	echo -e "You have $# arguments. You must enter the required arguments\n
Argument: Frist argument is the repo owner, Second argument is the repo name."
else
	list_users_with_read_access
fi
}

main "$1" "$2"