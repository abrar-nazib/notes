# Used commands in vim

## Vim Modes

* Normal Mode (or Command Mode)
* Insert Mode
* Line Mode

## Normal mode command pattern

anything inside [] is **[optional]**\
operation\
{motion}\
[count]operation\
[count]{motion}\
[count]operation{motion}\
[count]operation[count]{motion}

## Commands

* **```:w[rite]```** Writes the file\
* **```:q[uit]```** Quits the vim editor\
* **```!```** Using bang after any command means to force that command{used to toggle in some other commnds}\
* **```.```** Repeat previous commnad\
* **```:f[ile]```** Shows informations about the file. Similar to ```ctrl+g```

## Navigation

* Move down a line: ```j```
* Move up a line: ```k```
* Move to the right: ```l```
* Move to left: ```h```
* Move one word to the right: ```w``` {```w``` treats punctuation marks as a word}\
  Move n words to the right:```nw```
* Move one word to the right: ```W``` {```W``` does not treat punctuation marks as a word so ignores them}
* Move one word to the left/backward: ```b``` {```b``` treats punctuation marks as a word}
* Move one word to the left/backward: ```B``` {```B``` does not treat punctuation marks as a word so ignores them}
* Move forward/pageDown: ```ctrl+f```
* Move backward/pageUp: ```ctrl+b```
* Reposition the screen: ```z+enter``` {Keeps the cursor to the specified line and scrolls the line to the top/near the top of the screen}
* Position cursor to the beginning of the line: ```0```
* Position cursor to the first character of the line ```^``` {Similar as regExp}
* Position cursor to the last character of the line ```$``` {Similar as regExp}
* Go to line n of the file: ```n+gg``` or ```n+G```\
  Go to line n of the file: ```:n```
* Go to the top of the file: ```gg``` {for ```gg```, if no line number is set, it takes 1 as the default line number}\
  Go to the top of the file: ```:^```
* Go to the end of the file ```G``` {for ```G```, if no argument is set, it takes last line as the default line number}\
  Go to the top of the file ```:$```
* Display information about the file(file location, line numbers and current line number) ```ctrl+g```
  
## Vim options

```set [option]``` Sets the option on
```set [option]!``` Bang at the end of the option toggles the option

## Deleting

Deleting in general:\
d {other command} -> delete according to the other command.

* Deleting a single character at the cursor position: ```x```
* Deleting a single character left to the cursor position: ```X```

**Talking in vim language:**\

* Deleting a single word from the cursor position: ```dw``` {deletes every single character until it finds space}\
  Deleting n words from the cursor position: ```ndw```
* Delete everyting to the last character of the line from the current position: ```d$``` or ```D```
* Delete everyting to the first character of the line from the current position: ```d^```
* Delete everything to the beginning of the current line: ```d0```
* Delete everything to the first line of the file from current cursor position: ```dgg```
* Delete everything to the last line of the file from current cursor position: ```dG```
* Delete current line: ```dd```
* Delete n lines: ```ndd```
* Delete everything to the next line from the cursor potition(including present line): ```dj```
* Delete everything to the previous line(including present line): ```dk```

## Vim help

**```:h[elp] command/{subject}```*** Shows help menu\

* ```ctrl+i``` gets to the next/(the command backed from) searched help
* ```ctrl+o``` gets to the previous searched help{similar to back button in browsers}\
* ```ctrl+]``` on any word of the help documentation emulates ```:help word``` program
* ```ctrl+ww``` allows to edit the file while keeping the help documentation on. Toggles the cursor between the files.
* ```:h :q<ctrl+d>``` for command completion. Lists all the commands starting with q.\
  It actually searches the pattern before the ```ctrl+d``` keybinding.\
  Same thing can be done by pressing ```tab``` key after the pattern with the wildmenu. ```shift+tab``` for selecting backwards.\
  ```wildmenu``` could be set and unset
* ```:h ^<key>``` In help menu, ```ctrl+<key>``` keybinding is searched replacing ctrl with  ```^``` 