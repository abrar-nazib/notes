#!/bin/bash

# The script disables, deletes, and/or archives users on the local system

ARCHIVE_DIR='/archive'


function usage(){
    # Display the usage and exit
    echo "Usage: $(basename ${0}) [-dra] USER [USERN]..." >&2
    echo "Disable a local linux account" >&2
    echo "  -d Deletes accounts instead of disabling them" >&2
    echo "  -r  Removes the home directory associated with the account(s)" >&2
    echo "  -a  Creates an archive of the home directory associated with the account(s)" >&2
    exit 1
}

# Make sure the script is being executed with superuser privilages.
if [[ "$(id -u)" -ne 0 ]]
then
    echo 'Please run with sudo or as root.' >&2
    exit 1
fi

# Parse the options
while getopts dra OPTION
do
    case ${OPTION} in
        d) DELETE_USER='true' ;;
        r) REMOVE_OPTION='-r' ;;
        a) ARCHIVE='true' ;;
        ?) usage ;;
    esac
done

# Remove the options while leaving the remaining arguments
shift "$(( OPTIND - 1 ))"

# If the user doesn't supply at least one argument, give them help.
if [[ "${#}" -lt 1 ]]
then
    usage
fi

# Loop through all the usernames supplied as arguments
for USERNAME in "${@}"
do
    echo "Processing user: ${USERNAME}"
    
    # Make sure the UID of the account is at least 1000
    USERID=$(id -u ${USERNAME})
    if [[ "${USERID}" -lt 1000 ]]
    then
        echo "Refusing to remove the ${USERNAME} account with UID ${USERID}" >&2
        exit 1
    fi
    
    # Create an arcgive if requested to do so
    if [[ "${ARCHIVE}" = 'true' ]]
    then
        # Make sure ARCHIVE_DIR directory exists
        if [[ ! -d "${ARCHIVE_DIR}" ]]
        then
            echo "Creating ${ARCHIVE_DIR} directory."
            mkdir -p ${ARCHIVE_DIR}
            if [[ "${?}" -ne 0 ]]
            then
                echo "The archive directory ${ARCHIVE_DIR} could not be created." >&2
                exit 1
            fi
        fi
        
        # Archive the user's home directory and move it into the ARCHIVE_DIR
        HOME_DIR="/home/${USERNAME}"
        ARCHIVE_FILE="${ARCHIVE_DIR}/${USERNAME}.tgz"
        if [[ -d "${HOME_DIR}" ]]
        then
            echo "Archiving ${HOME_DIR} to ${ARCHIVE_DIR}"
            tar -zcf ${ARCHIVE_FILE} ${HOME_DIR} &> /dev/null
            if [[ "${?}" -ne 0 ]]
            then
                echo "Could not create ${ARCHIVE_FILE}" >&2
                exit 1
            fi
        else
            echo "${HOME_DIR} does not exist or is not a directory" >&2
            exit 1
        fi
    fi
        
    if [[ "${DELETE_USER}" = 'true' ]]
    then
        # Delete the user
        userdel ${REMOVE_OPTION} ${USERNAME}
    
        # Check to see if the userdel command succeeded
        # We don't want to tell the user that an account was deleted when it hasn't been
        if [[ "${?}" -ne 0 ]]
        then
            echo "The account ${USERNAME} was not deleted" >&2
            exit 1
        fi
        echo "The account ${USERNAME} was deleted"
    else
        chage -E 0 ${USERNAME}
        if [[ "${?}" -ne 0 ]]
        then
            echo "The account ${USERNAME} was not disabled" >&2
            exit 1
        fi
        echo "The account ${USERNAME} was disabled."
    fi
done

exit 0
