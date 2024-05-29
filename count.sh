#!/bin/bash

#########################
# Name: Oluwatosin Ogunfile
# Date: 29/05/2024
#
# This script counts the number of character in a string
#########################

# Enable debug mode
#set -x

counter(){
    local character_length=$(echo -n "$1" | wc -c)

    if [[ $character_length -ne 1 ]] ; then
  
	echo "Enter a single character as the first argument"

    else
  
	# Count s using echo to deliver strings to the stdin of grep
  	echo "$2" | grep -o "$1" | wc -l

  	# Alternate method
  	#grep -o "$1" <<<"$2" | wc -l
    fi
}

counter "$1" "$2"
