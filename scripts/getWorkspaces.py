#!/bin/python

from __future__ import print_function
import i3ipc

i3 = i3ipc.Connection()

ws = i3.get_workspaces()

for w in ws:
    print("{}".format(w['name']))
