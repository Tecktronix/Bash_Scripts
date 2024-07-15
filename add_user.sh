#! /bin/bash

#################################################
# Author: Oluwatosin Ogunfile
#
# Date: 15/07/2024
#
# This script adds users, deletes users, and print srcript usage
#
# Arguments: -a - Adds a user
#            -d - Deletes a user
#            -h - Prints the script usage
#
# Usage: myuseradd.sh -a <login> <passwd> <shell> - add a user account\n
#        myuseradd.sh -d <login>  - remove a user account\n
#        myuseradd.sh -h          - display this usage message
#################################################

# Enable debug mode
#set -x

# Enable an exit if an error is encountered
#set -e

# Enable an exit if an error is encountered before a pipe
#set -o pipefail

# Prints the usage of this script
function print_usage () {
	echo "print_usage"
	echo -e "Usage:\tmyuseradd.sh -a <login> <passwd> <shell> - add a user account\n
 	\tmyuseradd.sh -d <login>  - remove a user account\n
 	\tmyuseradd.sh -h          - display this usage message"
}



# This function deletes a user
# Arguments : userToDelete

function delete_user () {
	if id -u "$2" >/dev/null 2>&1
	then
  		userdel -r "$2" >/dev/null 2>&1
		echo "$2 is deleted"
	else
  		echo "ERROR: $2 does not exist"
  	fi

}



# This function adds a user
# Arguments : userToAdd, userPassword (in plain text), shell

function add_user () {
	if id -u "$2" >/dev/null 2>&1 
	then
  		echo "ERROR: $2 exists"
	else
  		useradd -m -s "$4" "$2"
		echo "$3" | passwd --stdin "$2" >/dev/null 2>&1
		echo "$2 ($3) with $4 is added"
	fi
}



# This is a function implements the print_usage, delete_user, and add_user functions based on the flag provided

function parse_command_options () {
case $1 in
-h ) print_usage
	;;
-d ) delete_user "$@"
	;;
-a )add_user "$@"
	;;
* ) echo -e "ERROR: Invalid option: $1"
	print_usage
	;;
esac
}


# This function executes the pasrse_command_options functions with provided arguments

parse_command_options "$@"