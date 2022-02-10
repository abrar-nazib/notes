#!/usr/bin/env python3

import xml.etree.ElementTree as ET


def parseXML(xmlfile):

    # create element tree object
    tree = ET.parse(xmlfile)

    # get root element
    root = tree.getroot()

    print(root.text)
    # for item in root:
    #     print(item.text)


xmlfile = open("file.xml", "r")
parseXML(xmlfile)
