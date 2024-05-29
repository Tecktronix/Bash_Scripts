#!/bin/bash

#########################
# Name: Oluwatosin Ogunfile
# Date: 28/05/2024
#
# This script counts the number of "s" in Mississippi
#########################

# Enable debug mode
#set -x

# Execute helper function
helper ()

# Set Mississippi as variable x
character=$1
word=$2

function counter {
# Count s using echo to deliver strings to the stdin of grep
echo $word | grep -o $character | wc -l

# Alternate method
grep -o $character <<<$word | wc -l
}

function helper {
character_length=$((echo $word | wc))
if [[$character_length -ne 1]];
then 
  echo "Enter a single character as the first argument"
else
  counter ()
fi
}
