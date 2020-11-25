// Influence_Zones.txt  by G.Landini 
// 4/Dec/2003
// creates inluence zones by skeletonisation of the background followed by pruning
// uses BinaryThin_.class avaliable from http://www.dentistry.bham.ac.uk/landinig
// assumes a white object on a black background

run("BinaryThin ", "kernel_a='1 1 1 2 1 2 0 0 0 ' rotations='rotate 45' iterations=-1");
run("BinaryThin ", "kernel_a='0 2 2 0 1 0 0 0 0 ' rotations='rotate 45' iterations=-1");
