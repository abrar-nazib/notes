#!/bin/bash

# Demonstrate the user of shift and while loops

# Display first three parameters.
echo "Parameter 1: ${1}"
echo "Parameter 2: ${2}"
echo "Parameter 3: ${3}"
echo

# Loop through all the positional parameters
while [[ "${#}" -gt 0 ]]
do
    echo "Number of parameters: ${#}"
    echo "Parameter 1: ${1}"
    echo "Parameter 2: ${2}"
    echo "Parameter 3: ${3}"
    echo
    shift
done
