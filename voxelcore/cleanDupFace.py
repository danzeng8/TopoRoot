#!/usr/bin/env python3
import os
import sys
import subprocess
import parse

MESHLAB_EXE = "D:\Program Files\VCG\MeshLab\meshlabserver.exe"

def remove_dup(input, pat):
	if not os.path.isdir(input):
		basename = os.path.basename(input)
		if parse.parse(pat, basename):
			print("removing dup faces for: "+basename)
			output = input
			#cmd = ['trimesh_util.exe', input, '-rmdupfaces', output]
			cmd = [MESHLAB_EXE, '-i', input, '-o', output, '-s', '../script/clean_mesh.mlx']
			subprocess.run(cmd)
	elif not input in ['.','..']: # os.path.isdir(input) == true:
		print("IN FOLDER: %s\n" % input)
		files = os.listdir(input)
		for f in files:
			remove_dup(os.path.join(input, f), pat)
		print('BACK UP ONE LEVEL.\n')

if __name__ == '__main__':
	input = sys.argv[1]
	pat = sys.argv[2] # a string, e.g. medial-{}-{:g}.off

	remove_dup(input, pat)