# Basic Commands I used for metasploit

## Links

https://www.exploit-db.com/docs/english/18229-white-paper--post-exploitation-using-meterpreter.pdf
https://www.offensive-security.com/metasploit-unleashed/

## Rough listing Metasploit

- `msfconsole` in bash starts the metasploit framework.
- `?/help` for starting help menu.
- `sessions` lists all the current sessions.
- `search <modulename>` searches module names and descriptions.
- `use <path_to_exploit_module/number_fromSearchResult>` select the module specified with the module path.
- `info` displys the module specified with the name.
- `options` displays the available options for the module specified.
- `set <option> <value>` sets the value for the specified option for the selected module.
- `set payload` sets the payload to be used for the operation.
- `show <category>` displays the options in specific category
- `advanced` displays the advanced options for the module specified.
- `exploit` starts the process of exploitation after the module is selected and configured accordingly.
  - `exploit -j` starts the process of exploitation in the background
  - `exploit -i` starts the process of exploitation in interactive mode. Gives a meterpreter shell after exploitation.

## Rough listing Meterpreter

- `getuid` will return the username of the victim machine.
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
