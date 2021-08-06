# Used commands in vim

## Vim Modes

* Normal Mode (or Command Mode)
* Insert Mode
* Line Mode

## Commands

**```:w```** Writes the file\
**```:q```** Quits the vim editor\
**```!```** Using bang after any command means to force that command

## Navigation

* Move down a line: ```j```
* Move up a line: ```k```
* Move to the right: ```l```
* Move to left: ```h```
* Move one word to the right: ```w``` {```w``` treats punctuation marks as a word}
* Move one word to the right: ```W``` {```W``` does not treat punctuation marks as a word so ignores them}
* Move one word to the left/backward: ```b``` {```b``` treats punctuation marks as a word}
* Move one word to the left/backward: ```B``` {```B``` does not treat punctuation marks as a word so ignores them}
* Move forward/pageDown: ```ctrl+f```
* Move backward/pageUp: ```ctrl+b```
* Reposition the screen: ```z+enter``` {Keeps the cursor to the specified line and scrolls the line to the top/near the top of the screen}
* Position cursor to the beginning of the line: ```0```
* Position cursor to the first character of the line ```^``` {Similar as regExp}
* Position cursor to the last character of the line ```$``` {Similar as regExp}
* Go to line n of the file: ```n+gg``` or ```n+G```
* Go to the top of the file: ```gg``` {for gg, if no line number is set, it takes 1 as the default line number}