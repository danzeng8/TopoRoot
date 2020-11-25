#!/usr/bin/env python3
import sys
import os
import subprocess
import memory_profiler
module_path = os.path.abspath(os.path.join('../script'))
if module_path not in sys.path:
    sys.path.append(module_path)
import ipynb.fs.defs.run_MA_def as run_MA_def

'''
generate voro medial-axis  
'''
profile_mem = False

def usage():
    print('To generate the MA for a mesh using powercrust|dey\'s:')
    print(procname + ' <mesh(.pts)> <exe path> [enable mem profiling (0|1)]')

procname = os.path.basename(sys.argv[0])
if (len(sys.argv) < 3 ):
    usage()
    exit(-1)
inputfile = sys.argv[1]
exe = sys.argv[2]
if len(sys.argv) > 3:
    profile_mem = sys.argv[3] == '1'
if os.path.isdir(inputfile): # process all .pts files in the folder
	folder = inputfile
	files = os.listdir(folder)
	for f in files:
		if not f.endswith('.pts'):
			continue
		inputfile = os.path.join(folder, f)
		if exe.endswith('tcocone.exe'):
			run_MA_def.runDey(exe, inputfile, profile_mem)	
		else:
			run_MA_def.runPC(exe, inputfile, profile_mem)
else: # just one input file to process
	if exe.endswith('tcocone.exe'):
		run_MA_def.runDey(exe, inputfile, profile_mem)	
	else:
		run_MA_def.runPC(exe, inputfile, profile_mem)