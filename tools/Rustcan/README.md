# Rustscan Commands used so far

## Links

[Doc](https://github.com/RustScan/RustScan/wiki/Things-you-may-want-to-do-with-RustScan-but-don't-understand-how)

## Basic Commands

- `rustscan -r ports -a <Target-ip> -- <nmap cmds>` Basic Command
- `rustscan -a <IP> --range <from>-<to> --scan-order "Random"`
  - `-a` for selecting target ip
  - `--range` or `-r` for specifying ports range
- `rustscan -a <IP> -q`
  - `-q` is for quiet scan
- `rustscan -a <IP> -b 100`
  - `-b` for selecting the batch size. Batch means how many scans per second

## Example command to copy

- `rustscan -a $(cat ip) -- -A -vv -sV -sC -oN nmap.txt`

