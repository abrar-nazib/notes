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

## Accounts

UID=0 is constant for root user in every linux system by default.\
```cat /etc/login.defs``` has got default user variables in them.

### ```id```

```bash
id          # returns the user id, group id and user name
id -u       # returns only the user id
id -u -n    # returns the user name -> id -n -u also works as 
id -un      # returns the same result as the previous one. Can combine single character flags
```

### ```useradd```

```bash
sudo useradd username       # By convention usernames are less than 8 characters long.
-c COMMENT                  # Comment is usually used for storing the Full Name of the user
-m USER_NAME                # creates home directory for the user according to USER_NAME
```

### ```su```

```bash
sudo su - username          # Here - or -l will create a new login shell
```

### ```passwd```

```bash
passwd --stdin $USER_NAME        # Normally passwd takes input from a prompt but in this case it will be taking from standard input
```

### Password Generation

### ```date```

```bash
date +%s        # Returns the time in seconds from January 1, 1970
date +%N        # Returns the nanoseconds
```

## If Statement

If in bash works with freakin opposite style of other programs.\
Here 0=true, 1=false.\
```[[]]``` is a shell builtin which works like a not gate which swaps 0 and 1\
Comparison operators: ```-eq, -ne,-lt, -le, -gt, or -ge```

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

**```read:```**

```bash
read -p 'Type something: ' INPUT_CONTAINER_VAR    # Show a prompt on the terminal and store the input inside a variable
```

## Process

```bash
ps -ef      # Shows every process on the process table
```

## Shortcuts

```bash
!c          #will execute the most recent command starting with c
```

## Cryptographic Functions

**Checksum:** A checksum is a numeric value calculated from a block of data that is relatively unique\
```ls -l /usr/bin/*sum``` returns all cryptographic functions inside the machine

**```sha```**

```bash
sha1sum file        # returns the sha1sum value of the file
sha256sum file      # returns the sha256sum value of the file
```

## Piping

Pipe converts the output from the previous command as standard input for the next command

## String Operations

**```head```**

```bash
head filename               # returns the first 10 lines of a file
head -n 1 filename          # -n is used for lines. This command returns the first line of the file
head -n1 filename           # same as the previous one. Flags also work this way
head -1 filename            # same as the previous but not universal for all commands. Works for this one only
head -c 5 filename          # -c stands for byte/character. This command returns the first 5 characters of the file
```

**```shuf```**\
Shuffles the lines of a file randomly

```bash
shuf file       # stdouts the randlomly shuffled file's lines
```

**```fold```**\

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

**```basename path```**\
Returns the base/executable file of a path{actually a dumb regExp command which treats the rightmost thing as base name}\
**```dirname path```**\
Similar to the ```base``` command but returns everything except the base name of a path

## Positional parameters and Special parameters

Positional parameters are the variables which contain contents of the command line.\
**Parameter:** Parameter is a variable which is being used inside a shell script.\
**Argument:** The data passed into the shell script.\
```$0``` stores the name of the script itself\
```$1``` stores the first argument passed to the command line.\
```$#``` stores how many parameters were passed to the command line.
```$@``` stores all the command line arguments {behaves like an array, starts from $1. Usually used in for loops}
```$*``` similar to the ```$@``` but treats all the cl arguments as a single argument 

## For Loop

```bash
for NAME [in WORDS ... ] ; do COMMANDS; done
    # Executes commands for each member in a list.
```

## While Loops

```bash
while COMMANDS; do COMMANDS; done # Execute commands as long as a test succeeds
```

**```shift```**

```bash

````

## Sleep

```bash
sleep - delay for a specified amount of time

sleep NUMBER[SUFFIX]...
sleep OPTION
```
