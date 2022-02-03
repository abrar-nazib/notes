# Find

## Finding directories belonging to specific user

- `find / -type f -user www-data > file2.txt`
  - `-group groupname` will search for files owned by certain group
- `find / -exec commandToExecute \;` to execute command on the files
- `find / -perm -u=s -type f 2>/dev/null` Works well
find / 2>/dev/null | grep flag