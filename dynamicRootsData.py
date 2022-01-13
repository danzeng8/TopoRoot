import os
import sys
import getopt
import csv

filename = sys.argv[1]
nodalCt = 0
with open(filename) as csvfile:
	filereader = csv.reader(csvfile, delimiter='\t')
	for row in filereader:
		if int(row[9]) == 1:
			nodalCt += 1

print(filename+","+str(nodalCt))