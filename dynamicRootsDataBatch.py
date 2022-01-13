import os
import sys
import getopt
import csv

def main(argv):
   inputfile = ''
   outputfile = ''
   try:
      opts, args = getopt.getopt(argv,"hi:o:v:d:",[""])
   except getopt.GetoptError:
      print('python dynamicRootsDataBatch.py -i <inputfile> -o <outputfile> -d <downsampling rate>')
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
         print('python dynamicRootsDataBatch.py -i <inputfile> -o <outputfile> -d <downsampling rate>')
         sys.exit()
      elif opt == '-i':
         inputfile = arg
      elif opt == '-o':
         outputfile = arg
   for filename in os.listdir(inputfile):
      if filename.endswith(".txt"):
         os.system("python dynamicRootsData.py " + inputfile+filename)

if __name__ == "__main__":
   main(sys.argv[1:])