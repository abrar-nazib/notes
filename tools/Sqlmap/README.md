# Commands of sqlmap I used so far

## Breif used options

* ```-r <requestfile>``` uses burp request file to attack the parameter
* ```-u <url>```  is for selecting the url of the target host {Have to provide with url parameters if using }
* ```-p``` <parameterName> is for setting the parameter to attack
* ```--dbms=<DBMS>``` is used for specifying the target dbms {Will test payloads for only the selected dbms}
* ```--level <1-5>``` specify how many sql strings to be tested. 1-5
* ```--dump-all``` dumps the table entry of the entire database
* ```--dbs``` Show all the databases inside the dbms
* ```-D <database>``` specify the database to enumerate after exploitation
* ```-T <tablename>``` specify the table to enumerate
* ```-C <columnName>``` specify the column to enumerate
* ```--os-shell``` try to gain an interactive os shell

