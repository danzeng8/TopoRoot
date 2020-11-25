import sys
import os

for i in range(len(sys.argv)-1):
	volName = sys.argv[i+1]
	volName = str(volName[:-4])
	os.system("C:/Users/danzeng/Desktop/voxelcore/voxelcore -md=vol2ma " + sys.argv[i+1] + " " + volName + ".ply -tt=0.001 -fullOrPruned=2")
	os.system("C:/Users/danzeng/Desktop/voxelcore/voxelcore -md=vol2mesh " + sys.argv[i+1] + " " + volName + " -onlyBndryVts=False")