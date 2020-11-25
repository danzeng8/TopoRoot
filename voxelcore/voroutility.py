#!/usr/bin/env python3
import sys
import os
import math
import time
import subprocess
import sys

def usage(valid_modes = []):
    help = '''
    voroutility mode args
    mode = ''' + str(valid_modes) + '''
    surf2voro args: octree_level input_mesh
    '''    
    print(help)
    
# global variables
mesh = '' # mesh file name 
meshbase = '' # the base for volume & voxel boundary
vol = '' # the volume file (created by polymender/to be input to other stages) 
ma = '' # the output medial axis file name
bndrybase = '' # the base for voxel boundary 
vorobase = '' # the base for voro files
thresh = 0 # the alpha pruning threshold

'''parameters of voxel applications'''
dofuncmap = False
mcBase = '' # the base name for a set of MC related files
mcMeasure = '' # the name of the measure on MC
smoothRatio = '0.1'

'''parameters to polymender'''
level = 7 # the max level of octree
scaleR = 0.9 # the scale ratio between model and size of grid

def resToLevel(r):
    r = max(float(r), 1.0)
    level = int(math.ceil( math.log( r, 2 ) ) )
    scaleR = min( r / (2**level), 0.99 )
    scaleR = float('{0:.2}'.format(scaleR))
    return (level, scaleR)
    
def startSection(_sec_name):
    print('\n')
    print('-----------' + '-'*len(_sec_name) + '-----------')
    print('-----------' + _sec_name + '-----------')
    print('-----------' + '-'*len(_sec_name) + '-----------')
    
def checkmode(_mode, valid_modes):
    if _mode not in valid_modes:
        print('Error: unrecognized mode')
        exit()

def makeVolName(mode, volbase):
    # choose a volume file. prefer using .sof, unless only .mrc exists.
    #vol = volbase+'.sof'
    vol = volbase+'.sog'
    if mode == 'voro2ma':
        if not os.path.isfile(vol):
            vol = volbase + '.mrc'
        if not os.path.isfile(vol):
            print("Error: couldn't find any volume file.")
            exit()
    print("using volume file: " + vol)
    return vol
    
def processArgs(args):
    print(args)
    if (len(args) == 0):
        return "empty"
    global vol, meshbase, bndrybase, ma
    global level, scaleR
    global thresh
    global mesh
    global dofuncmap, mcBase, mcMeasure, smoothRatio
    if (args[0] == 'vol2ma'):
        # expect vol-name, alpha-thresh
        vol = args[1]
        thresh = args[2]
        meshbase = os.path.splitext(vol)[0]
        bndrybase = meshbase
        ma = meshbase+'_ma.ply'
        processArgs(args[2:]) # process rest
    elif (args[0] == 'voro2ma'):
        meshbase = args[1]
        vol = makeVolName('voro2ma', meshbase)
        thresh = args[2]
        print(meshbase)
        print(vol)
        bndrybase = meshbase
        ma = meshbase+'_ma.ply'
        processArgs(args[3:]) # process rest
    elif (args[0] == 'surf2ma'):
        r = args[1] # resolution of volume grids
        level, scaleR = resToLevel(r)
        mesh = args[2]
        thresh = args[3]
        #print("mesh: "+mesh)
        if mesh.endswith(".ply"):
            meshbase = os.path.splitext(mesh)[0]+'_'+r
        else:
            meshbase = mesh+'_'+r
        vol = makeVolName('surf2ma', meshbase)
        bndrybase = meshbase # input boundary file base
        ma = meshbase+'_ma.ply'
        processArgs(args[4:]) # process rest
    elif (args[0] == 'dofuncmap'):
        dofuncmap = True
        mcBase = args[1]
        mcMeasure = args[2]
        smoothRatio = args[3]
        print("app: dofuncmap, " + "mc-msure: " + mcMeasure)
def surf2vol(_profiling = False):
    startSection('PolyMender creates .sof/.sog')
    cmd = ' PolyMender-dc'+' "'+mesh+'" '+str(level)+' '+str(scaleR)+' "'+vol+'" '
    print(cmd)
    sys.stdout.flush()
    os.system(cmd)
#@profile
def surf2voxelboundary(_profiling = False):
    '''
    convert mesh of 3d shape to the voxelized boundary.
    '''
    # polymender creates .sof/.sog
    surf2vol(_profiling)
    # our voro tool creates voxel boundary
    vol2voxel(vol, bndrybase)
    
def vol2voxel(vol, bndrybasename):
    '''
    convert volume to voxel boundary
    '''
    # sof/mrc to voxel mesh/vertices
    startSection('volume to voxel boundary')
    cmd = '"'+'voroUtil -md=vol2mesh -onlyBndryVts=true "'+vol+'" "'+bndrybasename+'"'+'"'
    #cmd = '"'+'voroUtil -md=vol2mesh -onlyBndryVts=false "'+vol+'" "'+bndrybasename+'"'+'"'
    print(cmd)
    sys.stdout.flush()
    os.system(cmd)

#@profile
def voxelboundary2voro(_profiling = False):
    '''
    convert the voxelized boundary to the voro representation using tetgen.
    '''
    # tetgen creates voro diagram from bndry
    startSection('tetgen')
    bndry = bndrybase+'.node'
    cmd = ' tetgen -E -N -F -v "'+bndry+'" ' # no tets files
    # cmd = ' tetgen -E -F -v "'+bndry+'" ' # writes tet's .node file
    s = time.clock()
    sys.stdout.flush()
    if _profiling:
        os.system('mprof.py run '+cmd)
    else:
        os.system(cmd)
    e = time.clock()
    print('time(TOTAL) -> tetgen: '+str((e-s)*1000)+' ms')
    
    # new voro files have ".1." in their names (weird thing of tetgen...)
    # get rid of the ".1." in those names
    # old voro files will be deleted if any such new files exist
    startSection('renaming')
    folder, file = os.path.split(os.path.abspath(meshbase))
    oldsub = '.1.v.'
    newsub = '.v.'
    subname = file + oldsub
    renamed = ''
    for otherfile in os.listdir(folder):
        if subname in otherfile:
            renamed = otherfile.replace(oldsub, newsub)
            oldfile = os.path.join(folder, otherfile)
            newfile = os.path.join(folder, renamed)
            if os.path.isfile(newfile):
                os.remove(newfile)
            os.rename( oldfile, newfile )
            #print(oldfile + " renamed to " + newfile)
    
def voro2mesh(thresh, _profiling = False):
    '''
    convert voro (in tetgen format) to a regular mesh format (e.g., .off, .ply).
    '''
    startSection('tetgen voro to mesh format')
    bndry = meshbase+'.node'
    global vorobase
    vorobase = meshbase
    #cmd = 'voroUtil -md=voro2mesh -needEuler '+'-siteFile='+'"'+bndry+'" "'+vol+'" "'+vorobase+'" "'+ma+'"'+' -outToDotma'
    cmd = 'voroUtil -md=voro2mesh -needEuler '+'-siteFile='+'"'+bndry+'" "'+vol+'" "'+vorobase+'" "'+ma+'"'+' -tt='+str(thresh)
    if dofuncmap:
        cmd = cmd + ' -dofuncmap=' + '"'+mcMeasure+'"' + \
        ' -mcBase=' + '"'+mcBase+'"' + ' -smoothR=' + str(smoothRatio)
        
    print(cmd)
    sys.stdout.flush()
    if _profiling:
        os.system('mprof.py run '+cmd)
    else:
        os.system(cmd)

#@profile
def vol2ma():
    cmd = 'voroUtil -md=vol2ma '+'"'+vol+'"'+' '+'"'+ma+'"'+' '+'-tt='+str(thresh)
    print(cmd)
    sys.stdout.flush()
    os.system(cmd)
    
#@profile 
def surf2ma():
    surf2vol()
    vol2ma()

'''    
#@profile
def vol2ma():
    vol2voxel(vol, bndrybase)
    voxelboundary2voro(_profiling = False)
    voro2mesh(_profiling = False, thresh = thresh)
'''

#@profile
def voro2ma():
    voro2mesh(_profiling = False, thresh = thresh)

#def main():
valid_modes = ['surf2ma', 'vol2ma', 'voro2ma']
dispatch = { 'surf2ma'  : surf2ma, 'vol2ma' : vol2ma, 'voro2ma' : voro2ma }
print("# args = "+str( len(sys.argv) ))
if (len(sys.argv) < 2 ):
    usage(valid_modes)
else:
    mode = sys.argv[1]
    checkmode(mode, valid_modes)
    processArgs(sys.argv[1:])
    dispatch[mode]()

#if __name__ == '__main__':  
#    main()