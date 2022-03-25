import os
import sys
import getopt
import csv

def main(argv):
   inputfile = ''
   outputfile = ''
   downsample = 1
   multi = False
   try:
      opts, args = getopt.getopt(argv,"hi:o:v:d:m:",[""])
   except getopt.GetoptError:
      print('python toporoot_batch.py -i <inputfile> -o <outputfile> -d <downsampling rate:optional> -m (1 or 0)')
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
         print('python toporoot_batch.py -i <inputfile> -o <outputfile> -d <downsampling rate:optional> -m (1 or 0)')
         sys.exit()
      elif opt == '-i':
         inputfile = arg
      elif opt == '-o':
         outputfile = arg
      elif opt == '-d':
         downsample = int(arg)
      elif opt == '-m':
         multi = bool(int(arg))
   print('Input directory is ', inputfile)
   print('Output directory is ', outputfile)
   print('Downsampling rate is ', downsample)
   for filename in os.listdir(inputfile):
      if not filename.endswith(".dat") and not filename.endswith(".raw"):
         outputStr = outputfile + filename[0:-4]
         print("Processing ", inputfile+filename)
         command = "TopoRoot --in " + inputfile+filename + " --out " + outputStr + " --d " + str(downsample)
         if multi:
            command = command + " --multi"
         os.system(command)
      if filename.endswith(".raw"):
         print("Processing ", inputfile+filename)
         datFile = inputfile+filename[0:-3] + "dat"
         outputStr = outputfile + filename[0:-4]
         command = "TopoRoot --in " + inputfile+filename + " --dat " + datFile + " --out " + outputStr + " --d " + str(downsample)
         if multi:
            command = command + " --multi"
         os.system(command)


if __name__ == "__main__":
   main(sys.argv[1:])