#!/usr/bin/python
import sys
import os
import math

'''
generate measure on voxel surface
'''
meshbase = ''
mcmsurename = ''
t = 0
thresh = { 
    'bt3' : 0.1, 
    'bt2' : 0.1,
    'length' : 0,
    'traveldist' : 0.1,
    'default' : 0
    }

def usage():
    print('This script generates a measure defined on voxel surface.')
    print(sys.argv[0] + ' <meshbase name> <mc measure name>')
    
if (len(sys.argv) < 3 ):
    usage()
    exit()

meshbase = sys.argv[1]
mcbase = meshbase+'_ma'
mcmsurename = sys.argv[2]
smooth_t = thresh.get(mcmsurename, thresh['default'])
cmd = ' voroutility.py voro2ma '+'"'+meshbase+'" '+str(t)+' dofuncmap '+\
'"'+mcbase+'"'+' "'+mcmsurename+'"'+' "'+str(smooth_t)+'"'
os.system(cmd)


