#!/bin/bash

# This script creates User accounts inside a linux machine
# You will be prompted to enter the username(login), person name and password
# The username, password, and host for the account will be displayed.

# Check for sudo privilage
if [[ $(id -u) -ne 0 ]]
then
    echo '[Error] This script requires sudo previlage to be executed.'
    echo '[-] Please run with sudo or as root.'
    exit 1
fi

# Collecting username
read -p 'Enter the username: ' USER_NAME

# Collecting Real Name (Contents for the description field)
read -p 'Enter the Real Name of the person: ' COMMENT

# Collecting password
read -p 'Enter the password: ' PASSWORD

# Create the user
useradd -c "${COMMENT}" -m $USER_NAME

# Check whether the user was created successfully or not
if [[ $? -ne 0 ]]
then
    echo "The account could not be created"
    exit 1
else
    
    # Create a password
    echo "${PASSWORD}" | passwd --stdin $USER_NAME
    
    # Check for the password creation
    if [[ "${?}" -ne 0 ]]
    then
        echo 'The password for the account could not be set'
        exit 1
    fi
    
    # Expire the password and force to change
    passwd -e ${USERNAME}
    
    # Show the informations
    echo
    echo "[*] Username: ${USER_NAME}"
    echo "[*] Password: ${PASSWORD}"
    echo "[*] Host: $(hostname -s)"
fi
exit 0

