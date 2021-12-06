# Notes On XSS

## Cheat Sheets

* [Cheat sheet from portswigger](https://portswigger.net/web-security/cross-site-scripting/cheat-sheet)
* [Mind Maps](https://github.com/imran-parray/Mind-Maps?fbclid=IwAR2Fku5VnWSrzVygr45FL351mMVDSa_Cd7VLYSFX4Mu_SODksITAKeARujs)
## Where to test

* Comment sections of websites where inputted text is stored and reflected.

## Test payloads

* ```<svg onload=alert(1)>```
* ```<img src="invalid_location" onerror="alert()">```
