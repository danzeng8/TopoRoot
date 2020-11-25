import os, sys
import shutil
module_path = os.path.abspath(os.path.join('../script'))
if module_path not in sys.path:
    sys.path.append(module_path)
import ipynb.fs.defs.run_MA_def as run_MA_def

### common options ###
#meshes = ['bimba','hand','chinese_lion','neptune']
meshes = ['cup_subd','elk_subd','fertility_subd','rockarm_subd']
folder = 'D:\Yajie\models\MA_shapes\subd_test'
satEXE = '../../medial curve proj/data/paper data/bin/mesecina3d.exe'
voxelexe = 'voroUtil.exe'
profile_mem = True
run_which = 'sat' # which method to run: 'sat' or 'voxel'

### SAT options ###
if run_which == 'sat':
    rs = [0.01, 0.007, 0.004]
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
        # summary
        run_MA_def.summarize(wd, voxelexe, run_MA_def.SATResultExtractor)
        os.rename(os.path.join(wd,'summary.csv'), os.path.join(wd,'summary_noscale.csv'))
        # now gen SAT with scale
        run_MA_def.runSAT(satEXE, mnewpath, rs, growth=1.1, profile_mem=profile_mem)
        # summary
        run_MA_def.summarize(wd, voxelexe, run_MA_def.SATResultExtractor)
        os.rename(os.path.join(wd,'summary.csv'), os.path.join(wd,'summary_scale.csv'))

### voxel options ###\
if run_which == 'voxel':
    t = 0.015
    res = [128, 256]
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
        run_MA_def.run_MA_def.runVoxel(mnewpath, res, t, profile_mem)
        # summary
        run_MA_def.summarize(wd, voxelexe, run_MA_def.VoxelResultExtractor)
