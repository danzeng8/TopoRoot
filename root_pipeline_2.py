import os
import sys
import getopt
import csv
#os.system('cmd /k "date"')

def main(argv):
   inputfile = ''
   outputfile = ''
   shape = -1
   downsample = 1
   u = 4
   l = 4
   raw = False
   datFile = ""
   width = 0
   height = 0
   slices = 0
   verbose = False
   rootShape = False
   try:
      opts, args = getopt.getopt(argv,"hi:o:s:d:e:u:l:x:v",[""])
   except getopt.GetoptError:
      print('test.py -i <inputfile> -o <outputfile>')
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
         print('test.py -i <inputfile> -o <outputfile>')
         sys.exit()
      elif opt == '-i':
         inputfile = arg
      elif opt == '-o':
         outputfile = arg
      elif opt == '-s':
         shape = arg
      elif opt == '-d':
         downsample = int(arg)
      elif opt == '-u':
         u = float(arg)
      elif opt == '-l':
         l = float(arg)
      elif opt == '-x':
         raw = True
         datFile = arg
      elif opt == '-v':
         verbose = True
   print('Input file is ', inputfile)
   print('Output file is ', outputfile)
   print('Shape is ', shape)
   print('Downsampling rate is ', downsample)
   if raw:
   	print('Dat file: ', datFile)
   	datFileIn = open(datFile, 'r')
   	lines = datFileIn.readlines()
   	count = 0
   	for line in lines:
   		count = count + 1
   		if count == 2:
   			lineD = line.strip().split(" ")
   			width = int(lineD[5])
   			height = int(lineD[6])
   			slices = int(lineD[7])

   if shape == -1:
      print('Shape threshold not set')
      rootShape = True
   if inputfile == '':
      print('No input directory set')
   if outputfile == '':
   	  print('No output file set')
   os.system('del tmp2\\holefill\\*.png')
   os.system('del tmp2\\downsampled\\*.png')
   os.system('del tmp2\\topoOut\\*.png')
   os.system('del tmp2\\*.ply')
   os.system('del tmp2\\*.mrc')
   os.system('del tmp2\\*.r')
   os.system('del tmp2\\*.csv')
   if raw == False:
	   if downsample > 1:
	   	os.chdir(r"fiji-win64/Fiji.app") 
	   	downsampleCommand = 'ImageJ-win64 --ij2 --headless --console --run "macros/downsampled.ijm" "input=' + "\'" + str(inputfile) + "', output='../../tmp2/downsampled/0000.png', step=" + str(downsample) + "\""
	   	print(downsampleCommand)
	   	os.system(downsampleCommand)
	   	os.chdir(r"../../TopoSimplifier")
	   else:
	   	os.chdir(r"TopoSimplifier")
   else:
	   	os.chdir(r"fiji-win64/Fiji.app") 
	   	downsampleCommand = 'ImageJ-win64 --ij2 --headless --console --run "macros/downsampleRaw.ijm" "input=' + "\'" + str(inputfile) + "',  output='../../tmp2/downsampled/0000.png', widthIn=" + str(width) + " , heightIn=" + str(height) + " , slicesIn=" + str(slices) + " ,step=" + str(downsample) + "\""
	   	print(downsampleCommand)
	   	os.system(downsampleCommand)
	   	os.chdir(r"../../TopoSimplifier")
   k = float(shape) + u
   n = float(shape) - l
   if downsample>1:
   	if shape == -1:
   		topoCommand = "TopoSimplifier.exe --in ../tmp2/downsampled/ --out ../tmp2/topoOut/ --finalTopo 0 --rootShape ../tmp2/rootShape.csv --S " + str(shape) + " --N " + str(n) + " --K " + str(k)
   	else:
   		topoCommand = "TopoSimplifier.exe --in ../tmp2/downsampled/ --out ../tmp2/topoOut/ --finalTopo 0 --S " + str(shape) + " --N " + str(n) + " --K " + str(k)
   else:
   	if shape == -1:
   		topoCommand = "TopoSimplifier.exe --in " + str(inputfile) + " --out ../tmp2/topoOut/ --finalTopo 0 --rootShape ../tmp2/rootShape.csv --S " + str(shape) + " --N " + str(n) + " --K " + str(k)	
   	else:
   		topoCommand = "TopoSimplifier.exe --in " + str(inputfile) + " --out ../tmp2/topoOut/ --finalTopo 0 --S " + str(shape) + " --N " + str(n) + " --K " + str(k)	

   


   os.system(topoCommand)
   os.chdir(r"../fiji-win64/Fiji.app")
   if rootShape:
   	with open('../../tmp2/rootShape.csv', newline='') as rootShapeFile:
   		rootreader = csv.reader(rootShapeFile, delimiter=' ')
   		ct = 0
   		for row in rootreader:
   			if ct == 0:
   				shape = int(row[0])
   				print("S automatically set to ", shape)
   				break
   			ct = ct + 1

   holeFillCommand = 'ImageJ-win64 --ij2 --headless --console --run "macros/holeFill2.ijm" "input=' + "\'" + "../../tmp2/topoOut/" + "', suffix=\'.png\', threshold=" + str(shape) + "\""
   print(holeFillCommand)
   os.system(holeFillCommand)
   os.chdir(r"../../TopoSimplifier")
   pngToMrcCommand = "TopoSimplifier.exe --in ../tmp2/holefill/ --out ../tmp2/topoOut.mrc --finalTopo 0 --K " + str(shape) + " --S " + str(shape) + " --N " + str(shape)
   os.system(pngToMrcCommand)
   os.chdir(r"../voxelcore")
   os.system("voxelcore -md=vol2ma ../tmp2/topoOut.mrc ../tmp2/topoOut.ply -fullOrPruned=1")
   os.system("voxelcore -md=vol2mesh ../tmp2/topoOut.mrc " + outputfile + " -onlyBndryVts=False")
   os.chdir(r"../et")
   os.system("EtDev --nogui -ma_file=../tmp2/topoOut.ply -r_file=../tmp2/topoOut.r -smooth_i=3 -theta_1=0.01 --export_skel")
   os.chdir(r"../")
   os.system("root_traits_auto.exe --in tmp2/topoOut_skel.ply --out tmp2/topoOut_skel_fixed.ply --fixStem --upperRadius 0.45 --lowerRadius 0.15")
   os.system("python skeleton-mst.py tmp2/topoOut_skel_fixed.ply "+outputfile+".ply")
   if verbose:
   	os.system("root_traits_auto.exe --in "+outputfile+".ply --out " + outputfile+"_hierarchy.ply --traits " + outputfile+"_traits.csv --branch --upperRadius 0.45 --lowerRadius 0.15")
   else:
   	os.system("root_traits_auto.exe --in "+outputfile+".ply --out " + outputfile+"_hierarchy.ply --traits " + outputfile+"_traits.csv --upperRadius 0.45 --lowerRadius 0.15")

if __name__ == "__main__":
   main(sys.argv[1:])