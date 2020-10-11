# FFUF (Fuzz Faster U Fool)

## Directory brute forcing

```bash
ffuf -u https://website.com/FUZZ -w wordlist.txt
    # normal brute forcing
ffuf -u https://codingo.io/FUZZ -w wordlist -recursion
    # recursive brute forcing
ffuf -u https://codingo.io/FUZZ -w ./wordlist -e .php
    # -e flag to add extension suffixes
ffuf -u https://codingo.io/W1 -w ./wordlist.txt:W1
    # :W1 for using multiple parameter fuzzing
ffuf -u https://W2.io/W1 -w ./wordlist.txt:W1, ./domains.txt:W2
    # seperated by comma

```

## Cookie based authentication

```bash
-b
    # -b flag is used to add cookie
```

## Header Based Authentication

```bash
-H
    # -b flag is used to add cookie
```

## Coloring the Output

```bash
-c
    #colors the output
```

## Autometic calibration

```bash
-ac
    # automatic calibration
```

## Filter or Match regular expression

```bash
-mr "regexp pattern"
    #Looks for the match
-fw
    #filters word
```

## Using with burp

```bash
-replay-proxy 127.0.0.1:8080
    # routes the successful commands via proxy
-x 127.0.0.1:8080
    # routes all the requests through burp
-request /request.txt
```
