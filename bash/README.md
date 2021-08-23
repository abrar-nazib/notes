# Bash Scripting Notes

Sharp+Bang -> Shbang. The location after this sign means the following code will be executed by the specified program/interpreter.
The actual command looks like ```/bin/bash filename```

```bash
#!/bin/bash
```

## Permissions

Script files should be given 755 Permission(rwx for owner, rx for group, rx for others)

1. x=1
2. w=2
3. r=4

## Location of executables

* ```type -a executable``` returns the location of the executable file\
  Also returns whether the binary/program is shell builtin or not.\
  Shell builtin program helps are acquaired by ```help program_name```
* ```which [-a] executable``` returns locations where executables with the specified name is located

## Variables

```bash
VAR='value'
echo "$VAR"     # using double quote makes the variable interpretable otherwise treated as string/constant
echo '$VAR'     # will not be working as the previous one
# So to mix up string and variable...
echo "This is how you need to write the $VAR"
echo "This is also another way to write the ${VAR}"
# Appending text while mixing string and variable
echo "Your ${VAR}es are great!"

# Storing output of a command inside a variable
VAR=$(command --flags)
VAR=`command --flags`

# Using with commands
command --flag $VAR     # If var is not expected to contain any spaces
command --flag "${VAR}" # If var is expected to contain any spaces
```

### SHELL variables

```man bash``` shows all the default variables

```bash
$UID        # Stores the user id. Root user's id is 0
$HOSTNAME   # Stores the hostname of the machine
$RANDOM     # When printed, prints each time a random number
$PATH       # Stores the command search path
```

## Manpage

```man bash``` gives many useful informations

```bash
command [OPTION] ... [ANOTHER OPTION]        # Everything in square brackets are optional flags
                                             # ... after any [] means multiple [] could be used in that program
```

## Users and Accounts

UID=0 is constant for root user in every linux system by default.\
```cat /etc/login.defs``` has got default user variables in them.

### **```id```**

```bash
id [username]           # returns the user id, group id and user name
id -u [username]        # returns only the user id
id -u -n [username]     # returns the user name -> id -n -u also works as 
id -un [username]       # returns the same result as the previous one. Can combine single character flags
```

### **```useradd```**

```bash
sudo useradd username       # By convention usernames are less than 8 characters long.
-c COMMENT                  # Comment is usually used for storing the Full Name of the user
-m USER_NAME                # creates home directory for the user according to USER_NAME
```

### **```su```**

```bash
sudo su - username          # Here - or -l will create a new login shell
```

### **```passwd```**

```bash
passwd $USERNAME            # Creates a prompt to change a user's password

command | passwd --stdin $USERNAME
passwd --stdin $USERNAME < ${FILE}
                            # Normally passwd takes input from a prompt but in this case it will be taking from standard input
passwd -e $USERNAME         # Expires the password and forces to change in first login 
passwd -l $USERNAME         # Locks the account's password. But this does not prevent a user to authenticate using ssh key
                            # This is not good way of locking an account so use chage instead
```

### **```userdel```**

```bash
userdel <username>
userdel -f/--force <username> # deletes the user account even if the user is logged in. Deletes the home directory as well.
userdel -r <username>  # deletes the user account along with the user's home directory
```

### **```usermod```**

```bash
usermod -s <shell location> <accountName>       #set the shell for specified user account
```

### **```chage```**

Used for expiring the user account

```bash
chage -E 0 <accountname>        # Normally sysadmins disables account with this command
chage -E <date:YYYY-MM-DD> <accountname>   # This one is a little bit better idea.
chage -E -1 <accountname>       # Revive the expired account
```

### Password Generation

### **```date```**

```bash
date +%s        # Returns the time in seconds from January 1, 1970
date +%N        # Returns the nanoseconds
date +%F        # Returns the full date
```

## If Statement

* If in bash works with freakin opposite style of other programs.
* Here 0=true, 1=false.
* ```[[]]``` is a shell builtin which works like a not gate which swaps 0 and 1
* Comparison operators: ```-eq, -ne,-lt, -le, -gt, or -ge```
* ```=```  replaces the ```==``` operator in bash.
* ```-f filename``` returns 0(true) if file exists on that path
* ```-d dirname``` returns 0(true) if directory exists on that path

```bash
if COMMANDS; then COMMANDS; [ elif COMMANDS; then COMMANDS; ]... [ else COMMANDS; ] fi
#The semi-colon works as command seperator

if [[ condition ]]          # if [ condition ] also works but that's older style of doing things
then
    COMMANDS
else
    COMMANDS
fi
```

## Exit command

```exit [n]``` If [n] is not specified, the exit status will be the exit status of the last executed command\
```"${?}"``` Stores the exit status of the last executed command.

```bash
exit 1      # stops the execution of the program and returns 1 to the std and exits

```

## Standard Inputs, Output, Error

[Code Example of STDIN, STDOUT, STDERR](Code/stdInOutErr.sh)
**FileDescriptors:** FD 0=STDIN, FD 1=STDOUT, FD 2=STDERR, FD &=bothSTDOUT&STDERR\
**```read:```**\

```bash
# Reads a line from the standart input

read -p 'Type something: ' INPUT_CONTAINER_VAR    # Show a prompt on the terminal and store the input inside a variable
read LINE < ${FILE}                               # Reads a line from the FILE. A newline character stops the execution
```

**```|```**\
**Pipe** converts the output from the previous command as standard input for the next command

```bash
command1 | command2         # The output of command1 works as stdInput of command2
# Pipes by default doesn't come with anything that could help to redirect stderr
# So to redirect stderr this method is used
command1 2>&1 | command2
# Here, the stderr of command1 also gets redirected to stdout and the stdout gets redirected through pipe
# In the new version, there is a simpler syntax
command1 |& command2
```

**```[fileDescriptor]> and [fileDescriptor]<```**\
**Redirection** redirects the stdout inside the file specified

```bash
command > file          # Writes stdout of command into file
                        # Whatever the command would have written into the terminal will go inside file
command > file 2>&1     # The stdout of command is getting inside file and stderr is being redirected inside stdin.
command &> file         # Both stdout and stderr is getting redirected into file.
command 2> file2        # If command faces any error, the error will go to file
command 2> /dev/null    #/dev/null is used for dumping something                
command < file          # Contents of file is used as stdin of the command
```

**```[fileDescriptor]>> and <<[fileDescriptor]**\
**Append or add**

```bash
command >> file         # Appends the stdout of the command into the file
command >> file 2>>&1   # The errors are also being redirected to stdin
command &>> file        # Appends both stdout and stderr inside file.
command 2>> file2       # Appends the stderr fo the command into the file2 
```

## Shortcuts

```bash
!c          # will execute the most recent command starting with c
sudo !!     # will execute the most recent command executed with root privilages 
!$          # takes the last argument of the previous command line and pastes it
```

## Cryptographic Functions

**Checksum:** A checksum is a numeric value calculated from a block of data that is relatively unique\
```ls -l /usr/bin/*sum``` returns all cryptographic functions inside the machine

### **```sha```**

```bash
sha1sum file        # returns the sha1sum value of the file
sha256sum file      # returns the sha256sum value of the file
```

## String Operations

### **```head```**

```bash
head filename               # returns the first 10 lines of a file
head -n 1 filename          # -n is used for lines. This command returns the first line of the file
head -n1 filename           # same as the previous one. Flags also work this way
head -1 filename            # same as the previous but not universal for all commands. Works for this one only
head -c 5 filename          # -c stands for byte/character. This command returns the first 5 characters of the file
```

### **```shuf```**\

Shuffles the lines of a file randomly

```bash
shuf file       # stdouts the randlomly shuffled file's lines
```

### **```fold```**\

Gets a stdin of a line. Then makes new lines. Official description ```wrap each input line to fit in specified width```

```bash
fold -w1 "mairala"
# m
# a
# i
# r
# a
# l
# a
```

### **```basename path```**\

Returns the base/executable file of a path{actually a dumb regExp command which treats the rightmost thing as base name}\

### **```dirname path```**\

Similar to the ```base``` command but returns everything except the base name of a path

## Parsing CLI inputs with or without Positional Parameters

* Positional parameters are the variables which contain contents of the command line.\
* **Parameter:** Parameter is a variable which is being used inside a shell script.\
* **Argument:** The data passed into the shell script.\
* ```$0``` stores the name of the script itself\
* ```$1``` stores the first argument passed to the command line.\
* ```$#``` stores how many parameters were passed to the command line.\
* ```$@``` stores all the command line arguments. Behaves like an array, starts from ```$1``` Usually used in for loops\
* ```$*``` similar to the ```$@``` but treats all the cl arguments as a single argument

### **```getopts```**

[Example code](Code/inputparse.sh)

```bash
getopts vl:s        # Here, l has a mandatory value. Thats why it's followed by the colon.
OPTARG              # when an option requires an argument, getopts stores the argument inside OPTARG variable
OPTIND              # Stores the position of next command line argument following the option
# This optind needs a bit of research
```

## For Loop

[For Loop example code](Code/for_loop.sh)

```bash
for NAME [in WORDS ... ] ; do COMMANDS; done
    # Executes commands for each member in a list.
```

## While Loops

[Code example of while loop](Code/while_loop.sh)

```bash
while COMMANDS; do COMMANDS; done # Execute commands as long as a test succeeds
```

### **```shift```**

```bash
sift    # pops the $1 variable and left shifts all the other ones
```

## Case Statements

[Case statement example](Code/case.sh)

```bash
case WORD in [PATTERN [| PATTERN]...) COMMANDS ;;]... esac
    Execute commands based on pattern matching.

```

## Functions

[Function code example](Code/function.sh)

```bash
function: function name { COMMANDS ; } or name () { COMMANDS ; }
    Define shell function.
function functionName{
local VARIABLE  # For local variable declaration inside function
readonly VARIABLE # For preventing modification of the variable
}
```

## Pattern and RegExp

* ```^``` at the beginning of the line
* ```$``` at the ending of the lin
* ```*``` Matches any string including null string
* ```?``` Matches any single character
* ```[...]``` Matches any characters contained within the brackets
* ```|``` Is treated as or symbol in pattern matching

### **```grep```**

```bash
command | grep [pattern]
grep -v 'pattern'        # shows the output where pattern did not match
grep -E 'extendedRegexpPattern' # for using extended regular expression pattern

```

## Sleep

```bash
sleep - delay for a specified amount of time

sleep NUMBER[SUFFIX]...
sleep OPTION
```

## Processes

The process with an ID of 0 is a process that is started when the system boots.

```bash
ps aux
```

## CronJobs

[Crontab Generator](https://crontab-generator.org/)\
[Cron Guru](https://crontab.guru/)\

| Value | Description                               |
| ----- | ----------------------------------------- |
| MIN   | What minute to execute at                 |
| HOUR  | What hour to execute at                   |
| DOM   | What day of the month to execute at       |
| MON   | What month of the year to execute at      |
| DOW   | What day of the week to execute at        |
| CMD   | The actual command that will be executed. |

```bash
crontab [-u user] file
crontab [ -u user ] [ -i ] { -e | -l | -r }

0 *12 * * * cp -R /home/cmnatic/Documents /var/backups/ # backs up Documents in every 12 hours
# If we do not wish to provide a value for that specific field, we simply just place an asterisk(*)
```

## Logging

Linux logfiles are stored in /var/logs

```bash
logger [options] [message]      # Will store the log message inside /var/log/messages
                                # /var/log/messages needs root permission to read
logger -t program-name message  # Writes the program name instead of the user name in the log file                                
```

## Mathematical operations

### **```(())```**

```bash
NUM1=$(( 1+2 ))      # ((expression)) is used for arithmatic operations.
NUM2=$(( 3+4 ))
TOTAL=$(( NUM1 + NUM2 ))
(( TOTAL++ ))       # Increments the value of TOTAL
(( TOTAL-- ))       # Decrements the value of TOTAL
(( TOTAL [+-*/]= 4))
```

### **```let```**

```bash
let NUM='2 + 1'   # similar to the (())
```

### **```expr```**

```bash
expr 1+2
NUM=$( expr 1+2 )
```

### **```bc```**

```bash
bc [options] [file]

[options]
    -l      --mathlib       Include math library
```

### ```awk```

```bash
awk 'BEGIN {print 6/4}'
```

## Searching directories

### **```locate```**

Locate uses a database to find files. The database is scheduled to update daily.\
But it can be forced to update by ```sudo updatedb```

```bash
locate filename
```

### **```find```**

Find does not use any pre configred database like ```locate``` does. And it performs recursive search

```bash
find <directory>            # shows result of recursive search inside specified directory
find <directory> -name <pattern> # shows the recursive search result inside the specified directory having the specified pattern
find <directory> 2> /dev/null # to avoid permission denied error message
```

## Linux Directories

/etc is for configuration files
/usr/bin is for binaries that other users can use
/usr/sbin is for binaries that super users can use

## Uncategorized commands

### **```tar```**

```bash
tar -cf archive.tar foo bar
        # Create archive.tar from files foo and bar.

tar -tvf archive.tar
        # List all files in archive.tar verbosely.

tar -xf archive.tar
        # Extract all files from archive.tar.
        # need to use -z if gzip is used
tar -zcf file.tar.gz file
        # implements gzip on the tarred file as well
```

### **```gzip```**

```bash
gzip file       # compresses the file and creates a .gz file
gunzip file.gz  # decompresses the file
```

## Data transformation

### **``cut```**

Is used for cutting out sections from each line of input it receives

```bash
cut OPTION... [FILE]

-b --bytes=LIST        # Cut by bytes
-c --characters=LIST   # Cut by characters
-f --fields=LIST       # Cut lines by feild
-d --delimeter=DELIM   # Cut lines by specified delimiter
   --output-delimiter=DELIM  # to set the output delimiter
cut -c 3 file           # shows the 3rd character of each line in the file
cut -c 1-4              # shows the 1-4 characters of each line in 
cut -c 4- file          # shows from 4th character to the end of the line for each line of file
cut -c -4 file          # Shows the first 4 characters of the file
cut -c 1,3,4 file       # Shows the first, third and fourth characters of the file for each line

## Anything before the first tab is considered a field
cut -f [other options similar to c/b]

## For delimeter separation, You have to specify the delimieter
cut -d ',' -f 1         # Seperates the line based on specified delimeter and -f for choosing the field
cut -d , -f -1
cut -d, -f 1
cut -d : -f 1,3 --output-delimiter=','      # Sets the output to be separated by ,(comma)
```

### **```awk```**

```bash
awk '{print $1, $2}' line
            # By default the field seperator for awk is whitespaces
awk -F 'FIELDSEPERATOR' '{print $2}' file   # prints the second field seperaed by specified field seperator
            # The expression inside braces means action
awk -F ':' '{print $1, $2}' /etc/passwd
            # here output delimiter is not coma, it's space
awk -F ':' '{print $1 "," $2}' /etc/passwd
            # here the output delimiter is set to comma
awk -F ':' '{print "UserName: " $1 ", UserID: " $3}' /etc/passwd
awk -F ':' '{print "UserName: " $1 ", SHELL: " $NF}' /etc/passwd
awk -F ':' '{print $(NF - 1) }' /etc/passwd
# $OFS stands for output feild seperator
# $NF stnds for number of fields
awk -f ':' -v OFS=',' '{print $1, $2}' /etc/passwd
        # -v is used for setting up a variable
```

## Networking

### **```netstat```**

```bash
netstat -n/--numeric     # Show numeric addresses of the ports instead of the services
netstat -p               # shows the PID of the process which opened the port
netstat -u/-udp          # show the udp networking activities
netstat -t/-tcp          # show the tcp networking activities
netstat -l/-listening    # Show the ports that are listening
netstat -4               # shows the activity from only tcp/udp version 4. Elemenates v6
```
