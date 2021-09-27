# Notes on the tool nikto

[Nikto wiki](https://github.com/sullo/nikto/wiki)\
**Basic options**

* ```-host``` to specify host or ip address
* ```-nossl``` to not use ssl to connect to the server
* ```-ssl``` force ssl to connect
* ```-id``` to authenticate, format is ```-id "id:password"```
* ```-Plugins``` to specify the plugins to be used while scanning ```-list-plugins``` for listing the available plugins
  * ```apacheusers``` plugin tries to enumerates usernames from the web server
* ```-dbcheck``` to check for syntax errors and stuffs in database
