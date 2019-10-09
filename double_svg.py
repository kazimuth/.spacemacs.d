#!/usr/bin/env python

from lxml import etree as et
import sys

if len(sys.argv) != 3:
    print("usage: double_svg.py FROM TO")

FROM = sys.argv[1]
TO = sys.argv[2]

print(f'doubling {FROM} to {TO}')
data = et.parse(FROM)
root = data.getroot()
root.attrib['width'] = str(int(root.attrib['width']) * 2)
root.attrib['height'] = str(int(root.attrib['height']) * 2)

data.write(TO)
