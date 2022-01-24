# Notes on Linux Privsec

## Links

- [GTFOBins](https://gtfobins.github.io/) Lists all linux binaries which could be used to bypass local security
-

## Checklist

- [ ] Weak file permisions
  - Check for weak file permissions in /etc/shadow or /etc/passwd
    - `root:x:0:0:root:/root:/bin/bash` just replace the x with an openssl generated password
    - `openssl passwd <passphrase>` generates a password to put in /etc/passwd
- [ ] Sudo shell escape sequence
  - List the programs which sudo allows to run without password.
    - `sudo -l`
- [ ] Look for setuid binaries
  - List all the program with setuid
    - `find / -perm -u=s -type f 2>/dev/null` will list all the files with setuid permissions
    - `find / -perm -4000 2>/dev/null` simpler version of the above command

## id
