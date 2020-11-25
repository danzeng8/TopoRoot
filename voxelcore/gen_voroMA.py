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
#res = [128,256,384,512,640,768,896,1024,1152,1280,1408,1536,1664,1792,1920,2048,2176,2304,2432,2560,2688,2816,2944]
res = [128,256,384,512,640,768,896,1024]
#res = [896,1024,1152,1280,1408,1536,1664,1792,1920,2048]
#res = [128]
t = '0.015' # a string representing only one num or a list of comma-sep numbers
profile_mem = False

def usage():
    print('To generate voro-approx.ed MA for a mesh:')
    print(procname + ' <mesh(.ply)> <dot-sep res list(no space)> [t] [enable mem profiling (0|1)]')
    print('To generate voro-approx.ed MA from a volume:')
    print(procname + ' <volume(.sof|.sog|.mrc)> [t] [enable mem profiling (0|1)]')

procname = os.path.basename(sys.argv[0])
if (len(sys.argv) < 2 ):
    usage()
    exit(-1)
inputfile = sys.argv[1]
format = os.path.splitext(inputfile)[1]
if format == '.ply':
    res = [int(r) for r in sys.argv[2].split(',')]
    if len(sys.argv) > 3:
        t = sys.argv[3]
    if len(sys.argv) > 4:
        profile_mem = sys.argv[4] == '1'
elif format=='.sof' or format=='.sog' or format=='.mrc':
    if len(sys.argv) > 2:
        t = sys.argv[2] 
    if len(sys.argv) > 3:
        profile_mem = sys.argv[3] == '1'
else:
    print('Error: invalid input format -> '+format)
    exit(-2)
run_MA_def.runVoxel(inputfile, res, t, profile_mem)
#log_dir = os.path.dirname(meshfile)
#voxelexe = 'voroUtil.exe'
#run_MA_def.voxelResults(log_dir, voxelexe)