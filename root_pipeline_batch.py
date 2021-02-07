import os
import sys
import getopt
import csv

def main(argv):
   inputfile = ''
   outputfile = ''
   downsample = 6
   try:
      opts, args = getopt.getopt(argv,"hi:o:v:d:",[""])
   except getopt.GetoptError:
      print('python root_pipeline_batch.py -i <inputfile> -o <outputfile> -d <downsampling rate>')
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
         print('python root_pipeline_batch.py -i <inputfile> -o <outputfile> -d <downsampling rate>')
         sys.exit()
      elif opt == '-i':
         inputfile = arg
      elif opt == '-o':
         outputfile = arg
      elif opt == '-d':
         downsample = int(arg)
   print('Input directory is ', inputfile)
   print('Output directory is ', outputfile)
   print('Downsampling rate is ', downsample)
   for filename in os.listdir(inputfile):
      if not filename.endswith(".dat") and not filename.endswith(".raw"):
         outputStr = outputfile + filename[0:-4]
         os.system("python root_pipeline.py -i " + inputfile+filename + " -o " + outputStr + " -d " + str(downsample) + " -b " + outputfile + "traits.csv")
      if filename.endswith(".raw"):
         print("Processing ", inputfile+filename)
         datFile = inputfile+filename[0:-3] + "dat"
         outputStr = outputfile + filename[0:-4]
         os.system("python root_pipeline.py -i " + inputfile+filename + " -x " + datFile + " -o " + outputStr + " -d " + str(downsample) + " -b " + outputfile + "traits.csv")




if __name__ == "__main__":
   main(sys.argv[1:])