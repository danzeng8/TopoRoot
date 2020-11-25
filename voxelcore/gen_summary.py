#!/usr/bin/env python3
import sys
import os
module_path = os.path.abspath(os.path.join('../script'))
if module_path not in sys.path:
    sys.path.append(module_path)
import ipynb.fs.defs.run_MA_def as run_MA_def

def usage():
    print('This generates a summary file for the voxel MAs in the given file.')
    print(sys.argv[0] + ' <folder> <extractor=voxel|sat|sat-scale|dey|pc> [voroUtil.exe path]')

if len(sys.argv) < 3:
    usage()
    exit(-1)
log_dir = sys.argv[1]
extractor = sys.argv[2]
if extractor == 'sat':
    extractor = run_MA_def.SATResultExtractor
elif extractor == 'sat-scale':
    run_MA_def.SATResultExtractor.with_scale = True
    extractor = run_MA_def.SATResultExtractor
elif extractor == 'voxel':
    extractor = run_MA_def.VoxelResultExtractor
elif extractor == 'dey':
    extractor = run_MA_def.DeyResultExtractor
elif extractor == 'pc':    
    extractor = run_MA_def.PCResultExtractor
else:
    print('invalid extractor: '+extractor)
    usage()
    exit(-1)
voxelexe = 'voroUtil.exe'
if len(sys.argv) > 3:
    voxelexe = sys.argv[3]
print(str(extractor))
run_MA_def.summarize(log_dir, voxelexe, extractor)
# run_MA_def.voxelResults(log_dir, voxelexe)