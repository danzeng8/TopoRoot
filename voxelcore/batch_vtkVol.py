#!/usr/bin/env python3
import os, sys
import parse
import subprocess

outfolder = r"D:\Yajie\models\MA_shapes\other-voxel\data"
#shape_dir = r"D:\Yajie\models\MA_shapes\subd_test\uov"
#shape_dir = r"D:\Yajie\models\uov_test"
#shapes = ['ellipsoid']
#res = [128,256,384,512,640,768,896,1024,1152,1280]

# convert .sog files to vtk volume
exe = 'tovtkvol.exe'

# for s in shapes:
# 	for r in res:
# 		name = s+'_'+str(r)
# 		print(name)
# 		file = os.path.join(shape_dir, s, name+'.sog')
# 		outfile = os.path.join(outfolder, name+'.vtk')
# 		cmd = [exe, file, outfile]
# 		subprocess.run(cmd)

def gen_vtkvol(input, pat):
	if not os.path.isdir(input):
		if parse.parse(pat, input):
			print("gen vtk vol for: "+input)
			name = os.path.splitext(os.path.basename(input))[0]
			output = os.path.join(outfolder, name+'.vtk')
			cmd = [exe, input, output]
			subprocess.run(cmd)
	elif not input in ['.','..']: # os.path.isdir(input) == true:
		print("IN FOLDER: %s\n" % input)
		files = os.listdir(input)
		for f in files:
			gen_vtkvol(os.path.join(input, f), pat)
		print('BACK UP ONE LEVEL.\n')

if __name__ == '__main__':
	input = sys.argv[1]
	pat = sys.argv[2] # a string to recognize volume file, e.g. '{}.sog'

	gen_vtkvol(input, pat)