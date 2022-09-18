# Find

## Overview

`find where what`

## Find with name

- `find / -name "filename.ext"`
- `find / -name "filename.*"` if don't know the rest
- `find / -name "*.ext"` for finding files with specific extensions
- `find / -iname "filename.ext"` for finding file but this time it's case insensitive

## Finding with file types

- `find / -type f -name "filename.ext"` to find file
- `find / -type d -name "dirname"` to find directory

## Finding with owner name

- `find / -type f -user username` to find file of a certain owner

## Finding with permission

- `find / -type f -perm u=r -name "filename"` will find file where user has read permission
  - u=user, g=group, o=others
  - r=read, w=write, x=execute, s=setuid
- `find /usr/bin -type f -user root -perm u=s` to find files with setuid sticky bit on

## Finding directories belonging to specific user

- `find / -type f -user www-data > file2.txt`
  - `-group groupname` will search for files owned by certain group
- `find / -exec commandToExecute \;` to execute command on the files
- `find / -perm -u=s -type f 2>/dev/null` Works well
  find / 2>/dev/null | grep flag
