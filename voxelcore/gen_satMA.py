#!/usr/bin/env python3
import sys
import os
import subprocess
import memory_profiler
module_path = os.path.abspath(os.path.join('../script'))
if module_path not in sys.path:
    sys.path.append(module_path)
import ipynb.fs.defs.run_MA_def as run_MA_def

def usage():
    print('This script generates MA using SAT for a mesh in .off format.')
    print(sys.argv[0] + ' <mesh filename> <comma-sep-res-list(no space)> [enable mem profiling (0|1)] [growth(default=1)]')

growth = 1
profile_mem = True
if (len(sys.argv) < 3 ):
    usage()
    exit()
meshfile = sys.argv[1]
rs = [float(r) for r in sys.argv[2].split(',')]
if len(sys.argv) > 3:
    profile_mem = sys.argv[3] == '1'
if len(sys.argv) > 4:
    growth = float(sys.argv[4])
#if len(sys.argv) > 4:
#    only_get_summary = sys.argv[4] == '1'
satEXE = os.path.abspath('../../medial curve proj/data/paper data/bin/mesecina3d.exe')
#rs = [0.01,0.009,0.008,0.007,0.006,0.005,0.004,0.003,0.002]
#rs = [0.01, 0.007, 0.004]
run_MA_def.runSAT(satEXE, meshfile, rs, growth=growth, profile_mem=profile_mem)
#log_dir = os.path.dirname(meshfile)
#voxelexe = 'voroUtil.exe'
#run_MA_def.voxelResults(log_dir, voxelexe)
