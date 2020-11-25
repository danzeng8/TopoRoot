import os, sys
import shutil
module_path = os.path.abspath(os.path.join('../script'))
if module_path not in sys.path:
    sys.path.append(module_path)
import ipynb.fs.defs.run_MA_def as run_MA_def

'''usage: dotmesh2pts <shapefolder whose subfolders contain .mesh file> <output folder>'''
shapefolder = sys.argv[1]
destfolder = sys.argv[2]
run_MA_def.batchMeshToPts(shapefolder, destfolder)