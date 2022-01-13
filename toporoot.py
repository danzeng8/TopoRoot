import os
import sys
import getopt
import csv
import time
import os.path
from os import path
#os.system('cmd /k "date"')

def main(argv):
   inputfile = ''
   outputfile = ''
   shape = -1
   downsample = 1
   k = -1
   n = -1
   raw = False
   datFile = ""
   width = 0
   height = 0
   slices = 0
   verbose = False
   rootShape = False
   batch = False
   batchTraitFile = ""
   multi = 0
   costType = 0
   plane = 0
   try:
      opts, args = getopt.getopt(argv,"hi:o:s:d:e:k:n:x:v:b:m:c:p:",[""])
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
         downsample = float(arg)
      elif opt == '-k':
         k = float(arg)
      elif opt == '-n':
         n = float(arg)
      elif opt == '-x':
         raw = True
         datFile = arg
      elif opt == '-v':
         verbose = True
      elif opt == '-b':
         batch = True
         batchTraitFile = arg
      elif opt == '-m':
         multi = int(arg)
      elif opt == '-c':
         costType = int(arg)
      elif opt == '-p':
         plane = 1
   print('Input file is ', inputfile)
   print('Output file is ', outputfile)
   timingfile = outputfile + "_timing.csv"
   if batch:
      timingfile = batchTraitFile + "timing.csv"
   print('Shape is ', shape)
   print('Downsampling rate is ', downsample)
   print('Cost type is ', costType)
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
   os.system('del tmp\\holefill\\*.png')
   os.system('del tmp\\preprocess\\*.png')
   os.system('del tmp\\downsampled\\*.png')
   os.system('del tmp\\topoOut\\*.png')
   os.system('del tmp\\*.ply')
   os.system('del tmp\\*.mrc')
   os.system('del tmp\\*.r')
   os.system('del tmp\\*.csv')

   t0 = time.perf_counter()
   if raw == False:
      if downsample > 1:
         os.chdir(r"fiji-win64/Fiji.app") 
         downsampleCommand = 'ImageJ-win64 --ij2 --headless --console --run "macros/downsampled.ijm" "input=' + "\'" + str(inputfile) + "', output='../../tmp/downsampled/0000.png', step=" + str(downsample) + "\""
         print(downsampleCommand)
         os.system(downsampleCommand)
         os.chdir(r"../../TopoSimplifier")
      else:
         os.chdir(r"TopoSimplifier")
   else:
         os.chdir(r"fiji-win64/Fiji.app") 
         downsampleCommand = 'ImageJ-win64 --ij2 --headless --console --run "macros/downsampleRaw.ijm" "input=' + "\'" + str(inputfile) + "',  output='../../tmp/downsampled/0000.png',widthIn=" + str(width) + " , heightIn=" + str(height) + " , slicesIn=" + str(slices) + " ,step=" + str(downsample) + "\""
         print(downsampleCommand)
         os.system(downsampleCommand)
         os.chdir(r"../../TopoSimplifier")
   t1 = time.perf_counter()
   downsampleTime = t1-t0
   print("downsampling time "+str(downsampleTime))
   #k = float(shape) + u
   #n = float(shape) - l

   if downsample>1:
      if shape == -1:
         preprocessCommand = "TopoSimplifier.exe --in ../tmp/downsampled/ --out ../tmp/preprocess/ --rootMorpho1 --finalTopo 0 --rootShape ../tmp/rootShape.csv --S " + str(shape) + " --N " + str(n) + " --K " + str(shape)
         #+ " " + str(outputfile+"pointShape.obj")
         #topoCommand = "TopoSimplifier.exe --in ../tmp/preprocess/ --out ../tmp/topoOut/ --finalTopo 0 --rootShape ../tmp/rootShape.csv --S " + str(shape) + " --N " + str(n) + " --K " + str(k) + " --costType " + str(costType) 
      else:
         preprocessCommand = "TopoSimplifier.exe --in ../tmp/downsampled/ --out ../tmp/preprocess/ --rootMorpho1 --finalTopo 0 --rootShape ../tmp/rootShape.csv --S " + str(shape) + " --N " + str(n) + " --K " + str(shape)
         #+ " --pointShape " + str(outputfile+"pointShape.obj")
         #topoCommand = "TopoSimplifier.exe --in ../tmp/preprocess/ --out ../tmp/topoOut/ --finalTopo 0 --S " + str(shape) + " --N " + str(n) + " --K " + str(k) + " --costType " + str(costType) 
   else:
      if shape == -1:
         preprocessCommand = "TopoSimplifier.exe --in " + str(inputfile) + " --out ../tmp/preprocess/ --finalTopo 0 --rootMorpho1 --rootShape ../tmp/rootShape.csv --S " + str(shape) + " --N " + str(n) + " --K " + str(shape)
         # + " " + str(outputfile+"pointShape.obj")
         #topoCommand = "TopoSimplifier.exe --in ../tmp/preprocess/ --out ../tmp/topoOut/ --finalTopo 0 --rootShape ../tmp/rootShape.csv --S " + str(shape) + " --N " + str(n) + " --K " + str(k) + " --costType " + str(costType)
      else:
         preprocessCommand = "TopoSimplifier.exe --in " + str(inputfile) + " --out ../tmp/preprocess/ --rootMorpho1 --finalTopo 0 --rootShape ../tmp/rootShape.csv --S " + str(shape) + " --N " + str(n) + " --K " + str(shape)
         #+ " --pointShape " + str(outputfile+"pointShape.obj")
         #topoCommand = "TopoSimplifier.exe --in ../tmp/preprocess/ --out ../tmp/topoOut/ --finalTopo 0 --S " + str(shape) + " --N " + str(n) + " --K " + str(k) + " --costType " + str(costType) 

   os.system(preprocessCommand)
   #if rootShape:

   with open('../tmp/rootShape.csv', newline='') as rootShapeFile:
      rootreader = csv.reader(rootShapeFile, delimiter=',')
      ct = 0
      for row in rootreader:
         if ct == 0:
            shape = int(row[0])
            if n == -1:
               n = int(row[1])
            if k == -1:
               k = int(row[2])
            print("S automatically set to ", shape)
            break
         ct = ct + 1
   #k = float(shape) + float(u)
   t2 = time.perf_counter()
   preprocessTime = t2-t1
   print("preprocessing time: ", preprocessTime)
   # --rootShape ../tmp/rootShape.csv
   if downsample>1:
      if shape == -1:
         topoCommand = "TopoSimplifier.exe --in ../tmp/preprocess/ --out ../tmp/topoOut/ --finalTopo 0 --S " + str(shape) + " --N " + str(n) + " --K " + str(k) + " --costType " + str(costType)
      else:
         topoCommand = "TopoSimplifier.exe --in ../tmp/preprocess/ --out ../tmp/topoOut/ --finalTopo 0 --S " + str(shape) + " --N " + str(n) + " --K " + str(k) + " --costType " + str(costType) 
   else:
      if shape == -1:
         topoCommand = "TopoSimplifier.exe --in ../tmp/preprocess/ --out ../tmp/topoOut/ --finalTopo 0 --S " + str(shape) + " --N " + str(n) + " --K " + str(k) + " --costType " + str(costType)
      else:
         topoCommand = "TopoSimplifier.exe --in ../tmp/preprocess/ --out ../tmp/topoOut/ --finalTopo 0 --S " + str(shape) + " --N " + str(n) + " --K " + str(k) + " --costType " + str(costType)
   os.system(topoCommand)
   print(topoCommand)
   t3 = time.perf_counter()
   topoTime = t3 - t2
   print("topology simplification time: ", topoTime)
   os.chdir(r"../fiji-win64/Fiji.app")
   

   holeFillCommand = 'ImageJ-win64 --ij2 --headless --console --run "macros/holeFill.ijm" "input=' + "\'" + "../../tmp/topoOut/" + "', suffix=\'.png\', threshold=" + str(shape) + "\""
   print(holeFillCommand)
   #still need to account for case where tiller 
   os.system(holeFillCommand)
   os.chdir(r"../../TopoSimplifier")
   # + " --pointShape " + str(outputfile+"pointShape_topo.obj")
   pngToMrcCommand = "TopoSimplifier.exe --in ../tmp/holefill/ --out ../tmp/topoOut.mrc --finalTopo 0 --K " + str(shape) + " --S " + str(shape) + " --N " + str(shape)
   os.system(pngToMrcCommand)


   os.chdir(r"../voxelcore")
   os.system("voxelcore -md=vol2ma ../tmp/topoOut.mrc ../tmp/topoOut.ply -fullOrPruned=1")
   os.system("voxelcore -md=vol2mesh ../tmp/topoOut.mrc " + outputfile + " -onlyBndryVts=False")
   t4 = time.perf_counter()
   voxelcoreTime = t4 - t3
   print("voxelcore time: ", voxelcoreTime)

   os.chdir(r"../et")
   os.system("EtDev --nogui -ma_file=../tmp/topoOut.ply -r_file=../tmp/topoOut.r -smooth_i=3 -theta_1=0.01 --export_skel")
   t5 = time.perf_counter()
   etTime = t5 - t4
   os.chdir(r"../")
   stemTime0 = time.perf_counter()
   if multi == 1:
      os.system("root_traits_auto.exe --in tmp/topoOut_skel.ply --out "+outputfile+"_skel_fixed.ply --fixStem --upperRadius 0.45 --lowerRadius 0.35 --multi")
   else:
      os.system("root_traits_auto.exe --in tmp/topoOut_skel.ply --out "+outputfile+"_skel_fixed.ply --fixStem --upperRadius 0.9 --lowerRadius 0.2 --radiusTolerance 1.6") #1.3 for d6, 1.8 for d4
   stemTime1 = time.perf_counter()
   stemITime = stemTime1 - stemTime0
   print("Stem identification time: ", stemITime)
   os.system("skeletonMST.exe --in "+outputfile+"_skel_fixed.ply --out tmp/acyclic.ply --gaussian 2.5")
   t6 = time.perf_counter()
   mstTime = t6 - stemTime1
   print("MST time: ", mstTime)
   #os.system("python skeleton-mst.py tmp/topoOut_skel_fixed.ply tmp/acyclic.ply")
   #0.4, 0.25
   if batch:
      if multi == 1:
         os.system("root_traits_auto.exe --in tmp/acyclic.ply --out " + outputfile+".ply --traits " + batchTraitFile+" --stemExists")
      else:
         os.system("root_traits_auto.exe --in tmp/acyclic.ply --out " + outputfile+".ply --traits " + batchTraitFile+" --stemExists --scaling 0.436 --radiusTolerance 1.6")
   else:
      if multi == 1:
         os.system("root_traits_auto.exe --in tmp/acyclic.ply --out " + outputfile+".ply --traits " + outputfile+"_traits.csv --stemExists --plane --annotation " + outputfile+"_annotations.txt")
      else:
         os.system("root_traits_auto.exe --in tmp/acyclic.ply --out " + outputfile+".ply --traits " + outputfile+"_traits.csv --stemExists --scaling 0.436  --radiusTolerance 1.6 --plane --annotation " + outputfile+"_annotations.txt")
   t7 = time.perf_counter()
   traitsTime = t7 - t6
   print("Traits time: ", traitsTime)
   f = open(timingfile, "a")
   if not path.exists(timingfile):
      f.write("Sample, Downsampling time, preprocess time, topology simplification time, voxelcore time, ET time, MST time, hierarchy time")
   f.write(str(outputfile)+","+str(downsampleTime)+","+str(preprocessTime)+","+str(topoTime)+","+str(voxelcoreTime)+","+str(etTime)+","+str(stemITime)+","+str(mstTime)+","+str(traitsTime)+"\n")

if __name__ == "__main__":
   main(sys.argv[1:])