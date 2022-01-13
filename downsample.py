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
   batch = False
   batchTraitFile = ""
   multi = 0
   costType = 0
   try:
      opts, args = getopt.getopt(argv,"hi:o:s:d:e:u:l:x:v:b:m:c:",[""])
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
      elif opt == '-u':
         u = float(arg)
      elif opt == '-l':
         l = float(arg)
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
   print('Input file is ', inputfile)
   print('Output file is ', outputfile)
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
   if raw == False:
      os.chdir(r"fiji-win64/Fiji.app")
      os.mkdir(str(outputfile))
      downsampleCommand = 'ImageJ-win64 --ij2 --headless --console --run "macros/downsampled.ijm" "input=' + "\'" + str(inputfile) + "', output=" + "\'" + str(outputfile) + "', step=" + str(downsample) + "\""
      print(downsampleCommand)
      os.system(downsampleCommand)
      os.chdir(r"../../")
   else:
      os.chdir(r"fiji-win64/Fiji.app")
      os.mkdir(str(outputfile))
      downsampleCommand = 'ImageJ-win64 --ij2 --headless --console --run "macros/downsampleRaw.ijm" "input=' + "\'" + str(inputfile) + "', output=" + "\'" + str(outputfile) + "',widthIn=" + str(width) + " , heightIn=" + str(height) + " , slicesIn=" + str(slices) + " ,step=" + str(downsample) + "\""
      print(downsampleCommand)
      os.system(downsampleCommand)
      os.chdir(r"../../")

if __name__ == "__main__":
   main(sys.argv[1:])