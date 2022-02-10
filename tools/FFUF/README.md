# Notes on FFUF

## Links

[Written Guideline From Codingo](https://codingo.io/tools/ffuf/bounty/2020/09/17/everything-you-need-to-know-about-ffuf.html)

## Installation

`go install github.com/ffuf/ffuf@latest`

## Directory listing

- `ffuf -u <targt_URL>/FUZZ -w <wordlist location> -e .ext`
  - `-u` for setting url
  - `FUZZ` will be replaced by items from the specified wordlist
  - `-w` is for specifying wordlist location
  - `-e` sets the extension to set. {The "." in ".ext" is important}
- `ffuf -u <target_URL>/W1 -w <wordlist_location>:W1 -e .ext`
  - here we are saying we are using `W1` instead of `FUZZ`-
  - Custom names other than `FUZZ` does not support recursion

### Recursive listing

- `ffuf -u <target_URL>/FUZZ -w <wordlist_location> -recursion`
  - `-recursion` flag will brute force the files recursively

### Redirecting result

- `ffuf -u <target_URL>/FUZZ -w <wordlist_location> -s | tee output.ffuf`
  - `-s` for silent result, no extra stuff
- `ffuf -u <target_URL>/FUZZ -w <wordlist_loaction> -of html -o outfile.ext`
  - `-of html` output filetype is html. It's html
  - `-o` is used to specify the output file name.

## Using matcher options

## Using authenticatiors

- `ffuf -u <url>/FUZZ -w <wordlist> -of <output_type> -o <outputfile.ext> -b "NAME1=VALUE1; NAME2=VALUE2"` for cookie based authentication
- `ffuf -u <url>/FUZZ -w <wordlist> -H "NAME1=VALUE1; NAME2=VALUE2"`
  - `-H` For using custom headers

## Using FFUF with burpsuite

- Save the request file from burp suite. Put `FUZZ` Keyword where needed
- `ffuf -request <requestfile> -w <wordlist>`
- `ffuf <general arguments> --replay-proxy http://127.0.0.1:8080` while burp is on
