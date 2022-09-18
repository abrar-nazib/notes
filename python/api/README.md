# Using web APIs using python

## Basics

## JSON

- JSON is a very important thing to master as most of the APIs return data in json format.
- **Serialization:** Process of converting python data-structures into json.
- **Deserialization:** Process of converting json string into python data structures.

```python
import json

data = {
    "president": {
        "name": "Zaphod Beeblebrox",
        "species": "Betelgeusian"
    }

with open("data_file.json", "w") as write_file:
    json.dump(data, write_file, indent=2)
        # json.dump converts python data-structures into json data and puts into a file.
        # The indent is for making the json data human readable

json_string = json.dumps(data)
    # convert python data-structures into json and puts into string variable. Notice the 's' after dump

with open("data_file.json", "r") as read_file:
    data = json.loads(read_file)
        # converts json data into python ds from a file

python_data = json.loads(json_string)
```

## Parsing complex json data

[Helpful link](https://hackersandslackers.com/extract-data-from-complex-json-python/)
