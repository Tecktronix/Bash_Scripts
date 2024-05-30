#!/bin/bash

#########################
# Name: Oluwatosin Ogunfile
# Date: 29/05/2024
#
# This script counts the number of characters in a string
#########################

# Enable debug mode
#set -x

counter(){
    # Check the length of characters of the first command argument
    local character_length=$(echo -n "$1" | wc -c)
    # Checks if the first argument length is not equal to 1
    if [[ $character_length -ne 1 ]] ; then
  	# Print an instruction for the user
	echo "Enter a single character as the first argument"
    else
	# Count s using echo to deliver strings to the stdin of grep
  	echo "$2" | grep -o "$1" | wc -l
  	# Alternate method
  	#grep -o "$1" <<<"$2" | wc -l
    fi
}

# Calls the counter function
counter "$1" "$2"
