#!/usr/bin/python
import sys
import os
import math

'''
profile voxel mem 
'''
mesh = ""
res = [768, 896, 1024]
t = 0.02

def usage():
	print(sys.argv[0] + " <mesh name>")

if (len(sys.argv) < 2 ):
    usage()
    exit()

for r in res:
	mesh = sys.argv[1]
	cmd = ' voroutility.py surf2ma '+str(r)+' "'+mesh+'" '+str(t)
	os.system(cmd)


