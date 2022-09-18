#!/bin/bash

# This script is the updated version of the user adding script.

# Check for root privilege
if [[ $(id -u) -ne 0 ]]
then
    echo 'This script requires sudo privilege to run.'
    exit 1
fi

# Check The argument count.
if [[ "${#}" -lt 1 ]]
then
    echo "Usage: ${0} USERNAME [DESCRIPTION]..."
    echo "Create and account on the local system with the USERNAME and a DESCRIPTION of the user
    exit 1
fi

# Aquire the username and shift the arguments
USERNAME="${1}"
shift

# Aquire the commnet
COMMENT="${*}"


# Create user account and check for the account creation
useradd -c "${COMMENT}" -m "${USERNAME}"

if [[ "${?}" -ne 0 ]]
then
    echo "The useradd command failed"
    exit
fi

# Make a password for the specified user and check for the creation
PASSWORD="$(date +%s%N | sha256sum | head -c 10)"

echo "${PASSWORD}" | passwd --stdin "${USERNAME}"

if [[ "${?}" -ne 0 ]]
then
    echo "The password for this ${USERNAME} account could not be created"
    exit
fi

# Expire the password
passwd -e "${USERNAME}"

# Show the information on the screen
echo
echo "username: ${USERNAME}"
echo "password: ${PASSWORD}"
echo "description: ${COMMENT}"
echo "host: $(hostname -s)"
echo
exit 0
