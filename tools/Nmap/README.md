# Nmap commands used so far

[Tryhackme Room](https://tryhackme.com/room/furthernmap)

## Basics to know

- Total 65535 ports are available in a computer
- 1024 ports are common ones
- If a syn request from nmap is dropped by firewall, nmap considers the port to be filtered

## Options

- `-A` For Aggressive mode, So noisy
- `-F` For faster scan
- `-T<1-5>` For specifying how faster the scan should be performed, the higher the number the speedier the scan
- `-p` <port/port-range> For specifying the port number to scan
- `-P-` For scanning all the ports
- `-sn` For performing ping scan, testing the host is up or not
- `-sS` For syn/Synchoronus scan
- `-sU` For UDP only scan
- `-sV` For guessing the version number of the service
- `-O` For os detection
- `-oN <path>` For storing the output in normal formatting scheme
- `-oA <path>` For storing the output in all the major formats
- `--script=<name>` For performing scan with specified script
- `--top-ports <number>` Will scan for top `<number>` pots only



## Raw commands

- `nmap -A 123.123.123.123 -T4` enable OS and version detection, script scanning, and traceroute
  - -T4 for faster execution; and then the hostname. -A is for aggressive scanning
- `nmap -p 80 123.123.123.123` scan specified port.
- `nmap -sn 0.0.0.0` Ping scan, see if the host is up or not.
- `nmap -sU 0.0.0.0` UDP scan
- `nmap -sS 0.0.0.0` For Syn/Synchronus scan
- `nmap -F 0.0.0.0` Fast scan
- `nmap 0.0.0.0. --script=default` or `nmap 0.0.0.0 -sC` Scan with default scripts
- `nmap 0.0.0.0 -oA` will output the text in three major formats-> text, script_kiddie, xml
- `nmap 0.0.0.0 -oN nmapOut.txt` output result in normal mode
- `nmap 0.0.0.0 -O` Enables os detection
- `nmap 0.0.0.0 -sV` tries to guess the version number of the service on the open port
-

## Basic Intro to Networking
