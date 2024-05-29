#!/bin/bash

#########################
# Name: Oluwatosin Ogunfile
# Date: 28/05/2024
#
# This script counts the number of "s" in Mississippi
#########################

# Enable debug mode
#set -x

# Set Mississippi as variable x
x="Mississippi"

# Count s using echo to deliver strings to the stdin of grep
echo $x | grep -o "s" | wc -l

# Alternate method
grep -o "s" <<<$x | wc -l
