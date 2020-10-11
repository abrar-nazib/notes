#!/usr/bin/env python3
import re
import requests
header_detection_pattern = re.compile(r"([\S]+):\s([\S]+)")
data_detection_pattern1 = re.compile(r"([\w%]+=[\w%]+)")
data_detection_pattern2 = re.compile(r"([\w%]+)=([\w%]+)")
endpoint_detection_pattern = re.compile(r"[GET|POST]\s(/[^?\s]+)")
params_detection_pattern1 = re.compile(r"[^=?&\s]+=[^=?&\s]+")
params_detection_pattern2 = re.compile(r"([^=?&\s]+)=([^=?&\s]+)")
debug = 0


def debug(message):
    global debug
    if(debug == 1):
        print(f"\n{message}\n")


def parse_post(line_array):
    debug("POST message is getting parsed")

    global header_detection_pattern
    global data_detection_pattern1
    global data_detection_pattern2
    global endpoint_detection_pattern
    headers = {}
    data = {}
    object = {}
    data_detect = data_detection_pattern1.findall(
        line_array[len(line_array)-1])
    for d in data_detect:
        dx = data_detection_pattern2.match(d)
        data[dx.group(1)] = dx.group(2)
    endpoint = endpoint_detection_pattern.findall(line_array[0])[0]
    debug(f"ENDPOINT = {endpoint}")

    for line in line_array:
        gp = header_detection_pattern.match(line)
        if(gp):
            if(gp.group(1) == "Origin"):
                url = gp.group(2)+endpoint
            if(gp.group(1) == "Host"):
                continue
            headers[gp.group(1)] = gp.group(2)
    object["url"] = url
    object["headers"] = headers
    object["data"] = data

    debug(f"URL = {url}")
    debug(f"Headers = {headers}")
    debug(f"Data = {data}")

    return object


def parse_get(line_array):
    debug("POST message is getting parsed")

    global header_detection_pattern
    global endpoint_detection_pattern
    global params_detection_pattern1
    global params_detection_pattern2
    headers = {}
    params = {}
    object = {}
    params_detect = params_detection_pattern1.findall(line_array[1])
    for param in params_detect:
        px = params_detection_pattern2.match(param)
        params[px.group(1)] = px.group(2)
    endpoint = endpoint_detection_pattern.findall(line_array[0])[0]
    for line in line_array:
        gp = header_detection_pattern.match(line)
        if(gp):
            if(gp.group(1) == "Host"):
                url = "https://" + gp.group(2) + endpoint
                continue
            headers[gp.group(1)] = gp.group(2)

    object["url"] = url
    object["headers"] = headers
    object["params"] = params

    debug(f"URL = {url}")
    debug(f"Headers = {headers}")
    debug(f"Params = {params}")

    return object


def parse_request(filename):
    line_array = []
    with open(filename, "r") as file:
        for line in file:
            line_array.append(line)
    if(len(re.findall(r"POST\s", line_array[0])) > 0):
        parsed_request = parse_post(line_array)
    elif(len(re.findall(r"GET\s", line_array[0])) > 0):
        parsed_request = parse_get(line_array)
    else:
        print("I can only parse GET and POST reuests")
    return parsed_request


def make_request(filename, params_mod={}, data_mod={}):
    request_object = parse_request(filename)
    debug("------------from make_request------------------")
    debug(request_object)
    if "data" in request_object:
        if(bool(data_mod)):
            debug("Triggered data_mod")
            for key in data_mod.keys():
                request_object["data"][key] = data_mod[key]

        debug(f"URL = {request_object['url']}")
        debug(f"HEADERS = {request_object['headers']}")
        debug(f"DATA = {request_object['data']}")

        response = requests.post(
            request_object["url"], headers=request_object["headers"], data=request_object["data"])
    else:
        if(bool(params_mod)):
            for key in params_mod.keys():
                request_object["params"][key] = params_mod[key]
        response = requests.get(
            request_object["url"], headers=request_object["headers"], params=request_object["params"])
    return response
