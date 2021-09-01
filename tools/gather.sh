#!/bin/bash

# This script gathers all the notes from every README file in the subdirectories and puts into Root README
echo "# Collected notes from all subdirectories with script" > README.md
for DIR in *
do
	if [[ -d $DIR ]]
	then
		FILE="${DIR}/README.md"
		while read LINE
		do
			if [[ "${LINE}" =~ ^# ]]
			then
				LINE="#${LINE}"
			fi
			echo "${LINE}" >> README.md
		done < ${FILE}
	fi
done
