# Nmap commands

These are the nmap commands I've used so far in my journy

* ```nmap -A 123.123.123.123 -T4``` enable OS and version detection, script scanning, and traceroute
  * -T4 for faster execution; and then the hostname. -A is for aggressive scanning
* ```nmap -p 80 123.123.123.123``` scan specified port.
* ```nmap -sn 0.0.0.0``` Ping scan, see if the host is up or not.
* ```nmap -sU 0.0.0.0``` UDP scan
* ```nmap -F 0.0.0.0``` Fast scan
* ```nmap 0.0.0.0. --script=default``` or ```nmap 0.0.0.0 -sC``` Scan with default scripts
* ```nmap 0.0.0.0 -oN nmapOut.txt``` output result in normal mode
* ```nmap 0.0.0.0 -O``` Enables os detection
* ```nmap 0.0.0.0 -sV``` tries to guess the version number of the service on the open port
* 