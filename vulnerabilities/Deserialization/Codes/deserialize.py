#!/usr/bin/env python3

import pickle
import base64


class cookie:
    def __init__(self, key, value):
        self.key = key
        self.value = value


# newCookie = cookie("key", "value")
# newCookie = {"replace": "mairala"}


# serialized_data = pickle.dumps(newCookie)

# print(serialized_data)

serialized_data = "gAN9cQBYCQAAAHJlcGxhY2VtZXEBWAcAAABkZWZhdWx0cQJzLg=="

deserialized_data = pickle.loads(base64.b64decode(serialized_data))
print(deserialized_data)
