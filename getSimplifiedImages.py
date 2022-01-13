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
         topoCommand = "TopoSimplifier.exe --in ../tmp/preprocess/ --out " + outputfile + " --finalTopo 0 --S " + str(shape) + " --N " + str(n) + " --K " + str(k) + " --costType " + str(costType)
      else:
         topoCommand = "TopoSimplifier.exe --in ../tmp/preprocess/ --out " + outputfile + " --finalTopo 0 --S " + str(shape) + " --N " + str(n) + " --K " + str(k) + " --costType " + str(costType) 
   else:
      if shape == -1:
         topoCommand = "TopoSimplifier.exe --in ../tmp/preprocess/ --out " + outputfile + " --finalTopo 0 --S " + str(shape) + " --N " + str(n) + " --K " + str(k) + " --costType " + str(costType)
      else:
         topoCommand = "TopoSimplifier.exe --in ../tmp/preprocess/ --out " + outputfile + " --finalTopo 0 --S " + str(shape) + " --N " + str(n) + " --K " + str(k) + " --costType " + str(costType)
   os.system(topoCommand)

if __name__ == "__main__":
   main(sys.argv[1:])