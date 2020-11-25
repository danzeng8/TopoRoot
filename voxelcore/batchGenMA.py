#!/usr/bin/env python3
import os, sys
import shutil
module_path = os.path.abspath(os.path.join('../script'))
if module_path not in sys.path:
    sys.path.append(module_path)
import ipynb.fs.defs.run_MA_def as run_MA_def
from cleanDupFace import remove_dup

### common options ###
satEXE = '../../medial curve proj/data/paper data/bin/mesecina3d.exe'
voxelexe = 'voroUtil.exe'
profile_mem = True
run_which = 'voxel' # which method to run: 'sat' or 'voxel'

### SAT options ###
#meshes = ['bimba','hand','chinese_lion','neptune']
# meshes = ['trefoil2_subd']
# folder = 'D:\Yajie\models\MA_shapes\subd_test\sat'
#meshes = ['DHTi42_arcmelted_reduce']
#folder = 'D:\Yajie\models\MA_shapes\iso-surf'
# meshes = []
# skip = ['elephant']
# folder = r'D:\Yajie\models\sat_test'
# files = os.listdir(folder)
# for f in files:
#     if f.endswith('.off') and not os.path.splitext(f)[0] in skip:
#         meshes.append(os.path.splitext(f)[0])
meshes = ['elephant']
folder = r'D:\Yajie\models\sat_test'
if run_which == 'sat':
    rs = [0.01,0.006]
    #rs = [0.01,0.009,0.008,0.007,0.006,0.005,0.004]
    for m in meshes:
        wd = os.path.join(folder, m)
        if not os.path.exists(wd):
            os.mkdir(wd)
        mfile = m+'.off'
        mpath = os.path.join(folder, mfile)
        mnewpath = os.path.join(wd, mfile)
        shutil.copy(mpath, mnewpath)
        
        print('input file: '+mnewpath)
        ## begin SAT
        # gen SAT medial axis w/o scaling
        run_MA_def.runSAT(satEXE, mnewpath, rs, growth=1, profile_mem=profile_mem)
        # summary before cleaning
        run_MA_def.SATResultExtractor.with_scale = False
        run_MA_def.summarize(wd, voxelexe, run_MA_def.SATResultExtractor)
        rename_to = os.path.join(wd,'summary_noscale_beforeclean.csv')
        if os.path.exists(rename_to):
            os.remove(rename_to)
        os.rename(os.path.join(wd,'summary.csv'), rename_to)
        # clean mesh
        remove_dup(wd, 'medial-{}.off')
        # summary after cleaning
        run_MA_def.SATResultExtractor.with_scale = False
        run_MA_def.summarize(wd, voxelexe, run_MA_def.SATResultExtractor)
        rename_to = os.path.join(wd,'summary_noscale_afterclean.csv')
        if os.path.exists(rename_to):
            os.remove(rename_to)
        os.rename(os.path.join(wd,'summary.csv'), rename_to)
        # now gen SAT with scale
        run_MA_def.runSAT(satEXE, mnewpath, rs, growth=1.1, profile_mem=profile_mem)
        # summary before cleaning
        run_MA_def.SATResultExtractor.with_scale = True
        run_MA_def.summarize(wd, voxelexe, run_MA_def.SATResultExtractor)
        rename_to = os.path.join(wd,'summary_scale_beforeclean.csv')
        if os.path.exists(rename_to):
            os.remove(rename_to)
        os.rename(os.path.join(wd,'summary.csv'), rename_to)
        # clean mesh
        remove_dup(wd, 'scale-{}.off')
        # summary after cleaning
        run_MA_def.SATResultExtractor.with_scale = True
        run_MA_def.summarize(wd, voxelexe, run_MA_def.SATResultExtractor)
        rename_to = os.path.join(wd,'summary_scale_afterclean.csv')
        if os.path.exists(rename_to):
            os.remove(rename_to)
        os.rename(os.path.join(wd,'summary.csv'), rename_to)

### voxel options ###
#meshes = ['cup_subd','elk_subd','fertility_subd','rockarm_subd']
#meshes = ['fertility_subd','hand_subd']
#folder = r'D:\Yajie\models\MA_shapes\subd_test\uov'
meshes = []
folder = r'D:\Yajie\models\uov_test'
files = os.listdir(folder)
for f in files:
    if f.endswith('.ply'):
        meshes.append(os.path.splitext(f)[0])
if run_which == 'voxel':
    t = '0.015,0.025'
    #res = [128,256,384,512,640,768,896,1024,1152,1280]
    res = [512,1024]
    for m in meshes:
        wd = os.path.join(folder, m)
        if not os.path.exists(wd):
            os.mkdir(wd)
        mfile = m+'.ply'
        mpath = os.path.join(folder, mfile)
        mnewpath = os.path.join(wd, mfile)
        shutil.copy(mpath, mnewpath)
        
        print('input file: '+mnewpath)
        ## begin SAT
        # gen SAT medial axis w/o scaling
        run_MA_def.runVoxel(mnewpath, res, t, profile_mem, cleanup=True)
        # summary
        run_MA_def.summarize(wd, voxelexe, run_MA_def.VoxelResultExtractor)
