# Notes on the tool nikto

## Useful Links

[Nikto wiki](https://github.com/sullo/nikto/wiki)\
**Basic options**

- `-H` for comprehensive help menu. Manpage does not contain many things. `-h` doesn't as well
- `-host` to specify host or ip address
- `-nossl` to not use ssl to connect to the server
- `-ssl` force ssl to connect
- `-id` to authenticate, format is `-id "id:password"`
- `-Plugins` to specify the plugins to be used while scanning `-list-plugins` for listing the available plugins
  - `apacheusers` plugin tries to enumerates usernames from the web server
  - `outdated` plugin tries to find out outdated softwares used in the web server
  - `tests` plugin runs standard tests on the target host
- `-dbcheck` to check for syntax errors and stuffs in database

## Basic Commands to copy

- `nikto -h <ip> | tee nikto.log`
